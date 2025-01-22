local promotedVocations = {
    { id = 5, name = "Master Sorcerer" },
    { id = 6, name = "Elder Druid" },
    { id = 7, name = "Royal Paladin" },
    { id = 8, name = "Elite Knight" },
}

local function printTable(tbl, prefix)
    prefix = prefix or ""
    for key, value in pairs(tbl) do
        if type(value) == "table" then
            logger.info(prefix .. tostring(key) .. ": (table)")
            printTable(value, prefix .. "  ") -- Recursão para sub-tabelas
        else
            logger.info(prefix .. tostring(key) .. ": " .. tostring(value))
        end
    end
end

local function getHighestSkill(player)
    local skills = {
        { id = SKILL_FIST, name = "Fist" },
        { id = SKILL_CLUB, name = "Club" },
        { id = SKILL_SWORD, name = "Sword" },
        { id = SKILL_AXE, name = "Axe" },
        { id = SKILL_DISTANCE, name = "Distance" },
        { id = SKILL_SHIELD, name = "Shield" }
    }

    local highest = { id = nil, name = nil, level = 0 }

    -- Verificar skills normais
    for _, skill in ipairs(skills) do
        local level = player:getSkillLevel(skill.id)
        if level > highest.level then
            highest = { id = skill.id, name = skill.name, level = level }
        end
    end

    -- Verificar magic level
    local magicLevel = player:getMagicLevel()
    if magicLevel > highest.level then
        highest = { id = "magic", name = "Magic Level", level = magicLevel }
    end

    return highest
end

local function openKnightSkillModal(player, highestSkill)
    local modal = ModalWindow({
        title = "Select Skill for Knight",
        message = "Choose the weapon skill you want to prioritize.",
    })

    -- Mapeamento explícito das escolhas
    local skillMap = {
        ["Club"] = SKILL_CLUB,
        ["Sword"] = SKILL_SWORD,
        ["Axe"] = SKILL_AXE
    }

    -- Adicionar as opções ao modal
    local choiceMap = {}
    for skillName, skillId in pairs(skillMap) do
        local choiceId = modal:addChoice(skillName)
        choiceMap[choiceId] = { name = skillName, id = skillId } -- Relaciona o ID da escolha com os detalhes da skill
    end

    -- Adicionar botões
    modal:addButton("Confirm", function(player, button, choiceId)
        if choiceId and choiceId.text then
            local selectedSkillId = skillMap[choiceId.text] -- Busca pelo nome da skill no mapeamento

            if selectedSkillId then
                -- Setar a skill escolhida para o nível mais alto
                player:setSkillLevel(selectedSkillId, highestSkill.level)

                -- Setar as outras skills para o nível 10
                for skillName, skillId in pairs(skillMap) do
                    if skillId ~= selectedSkillId then
                        player:setSkillLevel(skillId, 10)
                    end
                end

                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your skill points have been transferred to " .. choiceId.text .. ".")
            else
                player:sendCancelMessage("Invalid choice.")
            end
        else
            player:sendCancelMessage("No choice was selected.")
        end
    end)

    modal:setDefaultEscapeButton(2) -- Define o botão de cancelamento como padrão
    modal:sendToPlayer(player)
end


local function applySkillChange(player, vocationId, highestSkill)
    if vocationId == VOCATION.ID.ROYAL_PALADIN then
        player:setSkillLevel(SKILL_DISTANCE, highestSkill.level)
        player:setSkillLevel(SKILL_AXE, 10)
        player:setSkillLevel(SKILL_SWORD, 10)
        player:setSkillLevel(SKILL_CLUB, 10)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your skill points have been transferred to Distance Fighting.")
    elseif vocationId == VOCATION.ID.ELDER_DRUID or vocationId == VOCATION.ID.MASTER_SORCERER then
        player:setMagicLevel(highestSkill.level)
        player:setSkillLevel(SKILL_AXE, 10)
        player:setSkillLevel(SKILL_SWORD, 10)
        player:setSkillLevel(SKILL_CLUB, 10)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your skill points have been transferred to Magic Level.")
    elseif vocationId == VOCATION.ID.ELITE_KNIGHT then
        openKnightSkillModal(player, highestSkill)
    end
end

local function isPlayerEquipped(player)
    -- Lista de slots para verificar (excluindo backpack)
    local slots = {
        CONST_SLOT_HEAD,
        CONST_SLOT_NECKLACE,
        CONST_SLOT_ARMOR,
        CONST_SLOT_RIGHT,
        CONST_SLOT_LEFT,
        CONST_SLOT_LEGS,
        CONST_SLOT_FEET,
        CONST_SLOT_RING,
        CONST_SLOT_AMMO
    }

    -- Verifica cada slot
    for _, slot in ipairs(slots) do
        local item = player:getSlotItem(slot)
        if item then
            return true -- Jogador está equipado
        end
    end

    return false -- Jogador não está equipado
end

local function addVocationChoice(window, player, vocation)
    window:addChoice(vocation.name, function(player, button)
        local highestSkill = getHighestSkill(player)
        if button.name == "Confirm" then
            if player:changeVocation(vocation.id) then
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have successfully changed your vocation to: " .. vocation.name .. "!")
                applySkillChange(player, vocation.id, highestSkill) -- Passa o maior skill como parâmetro
            else
                player:sendCancelMessage("An error occurred while trying to change your vocation.")
            end
        end
        return true
    end)
end

-- Função para localizar valores em tabelas aninhadas
local function findInNestedTable(tbl, key, value)
    for _, subTable in ipairs(tbl) do
        if subTable[key] == value then
            return true
        end
    end
    return false
end

function Player:sendVocationSelectionModal(title, message)
    local currentVocationId = self:getVocation():getId()

    local window = ModalWindow({
        title = title,
        message = message,
    })

    -- Add vocations to the modal excluding the current one
    for _, vocation in ipairs(promotedVocations) do
        if vocation.id ~= currentVocationId then
            addVocationChoice(window, self, vocation)
        end
    end

    window:addButton("Confirm")
    window:setDefaultEnterButton(0)
    window:sendToPlayer(self)

    return true
end

local vocationItem = Action()
function vocationItem.onUse(player, item, fromPosition, target, toPosition, isHotkey)

    if isPlayerEquipped(player) then
        player:sendCancelMessage("You cannot change your vocation while equipped. Please unequip all items first.")
        return true
    end

    -- Check if the player is promoted
    if not findInNestedTable(promotedVocations, "id", player:getVocation():getId()) then
        player:sendCancelMessage("You must be promoted to change your vocation.")
        return true
    end 

    if player:sendVocationSelectionModal("Select your new vocation", "Choose one of the available options to change your vocation.") then
        item:remove(1)
    else
        player:sendCancelMessage("You cannot use this item right now.")
    end
    return true
end

vocationItem:id(12540)
vocationItem:register()