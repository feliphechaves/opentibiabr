-- Configurações centralizadas
local Config = {
    SanguineEmber = {
        radius = 2,
        damageFactor = 0.15,
        effect = CONST_ME_FIREAREA
    },
    SanguineFrost = {
        effect = CONST_ME_ICEAREA,
        rootDuration = 6, -- Duração do root em segundos
        rootEffect = CONST_ME_ICETORNADO,
        stepInActionId = 51111, -- Action ID único para o tile de root
        itemIdTile = 8426,
        damageFactor = 0.3,
    }
}

local sanguineEmberDeath = CreatureEvent("SanguineEmberDeath")

-- Função de explosão (Sanguine Ember)
function sanguineEmberDeath.onDeath(creature)
    local position = creature:getPosition()
    local settings = Config.SanguineEmber

    -- Explosão de fogo
    for x = -settings.radius, settings.radius do
        for y = -settings.radius, settings.radius do
            local targetPos = Position(position.x + x, position.y + y, position.z)
            if not Tile(targetPos):hasProperty(CONST_PROP_BLOCKSOLID) then
                targetPos:sendMagicEffect(settings.effect)
            end
        end
    end

    -- Aplicar dano em área
    for _, target in ipairs(Game.getSpectators(position, false, true, settings.radius, settings.radius, settings.radius, settings.radius)) do
        if target:isPlayer() then
            target:addHealth(-target:getHealth() * settings.damageFactor, settings.effect)
        end
    end
end

sanguineEmberDeath:register()

-- Evento de morte do Sanguine Frost
local sanguineFrostDeath = CreatureEvent("SanguineFrostDeath")

--[[
function sanguineFrostDeath.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)

    if not creature or not attacker then
		return primaryDamage, primaryType, secondaryDamage, secondaryType
	end

    local position = creature:getPosition()
    local settings = Config.SanguineFrost

    -- Criar efeito visual da morte
    position:sendMagicEffect(settings.effect)
    
    -- Criar um tile especial na posição com Action ID
    local tileItem = nil;
    local tile = Tile(position)
    if tile then
        if not tile:getItemById(settings.itemIdTile) then
            tileItem = Game.createItem(settings.itemIdTile, 1, position)
            tileItem:setActionId(settings.stepInActionId)
            addEvent(function() tileItem:remove() end, 30 * 1000)
        end
    end

    return primaryDamage, primaryType, secondaryDamage, secondaryType

end
]]

function sanguineFrostDeath.onDeath(creature)

    local position = creature:getPosition()
    local settings = Config.SanguineFrost

    -- Criar efeito visual da morte
    position:sendMagicEffect(settings.effect)
    
    -- Criar um tile especial na posição com Action ID
    local tileItem = nil;
    local tile = Tile(position)
    if tile then
        if not tile:getItemById(settings.itemIdTile) then
            tileItem = Game.createItem(settings.itemIdTile, 1, position)
            tileItem:setActionId(settings.stepInActionId)
        end
    end

    if tileItem then
        -- Remover o tile após a duração do efeito
        addEvent(function()
            local item = Tile(position):getItemById(settings.itemIdTile)
            if item then
                item:remove()
            end
        end, 30 * 1000)
    end

end

sanguineFrostDeath:register()

-- Evento StepIn para aplicar condition paralyze
local frostTileStepIn = MoveEvent()

function frostTileStepIn.onStepIn(creature, item, position, fromPosition)
    local settings = Config.SanguineFrost
    if creature:isPlayer() then
        local condition = Condition(CONDITION_PARALYZE)
        condition:setParameter(CONDITION_PARAM_TICKS, Config.SanguineFrost.rootDuration * 1000)

        creature:addCondition(condition)
        creature:addHealth(-creature:getHealth() * settings.damageFactor, settings.effect)

        position:sendMagicEffect(Config.SanguineFrost.rootEffect)

    else
        local monster = creature:getMonster()
        if monster and monster:getName() == "Sanguine Frost" then
            local healAmount = math.random(15000, 20000)
            monster:addHealth(healAmount)
        end
    end

    if item then
        item:remove()
    end

    return true
end

frostTileStepIn:aid(Config.SanguineFrost.stepInActionId)
frostTileStepIn:register()

