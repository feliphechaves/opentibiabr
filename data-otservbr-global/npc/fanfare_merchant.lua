local internalNpcName = "Fanfare Merchant"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2
local npcLifetime = 3 * 60 * 1000 -- Tempo de vida do NPC em milissegundos (5 minutos)

npcConfig.outfit = {
    lookType = 217,
    lookHead = 0,
    lookBody = 0,
    lookLegs = 0,
    lookFeet = 0,
    lookAddons = 0,
}

npcConfig.flags = {
    floorchange = false,
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
    npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
    npcHandler:onAppear(npc, creature)

    -- Define o tempo de vida do NPC
    local npcId = npc:getId() -- Armazena o ID do NPC para futura verificação
    addEvent(function()
        local currentNpc = Creature(npcId) -- Recupera o NPC pelo ID
        if currentNpc then
            local position = currentNpc:getPosition()
            currentNpc:remove()
            if position then
                position:sendMagicEffect(CONST_ME_POFF)
            end
        end
    end, npcLifetime)
end

function removeNpc(npc)
	addEvent(function()
		if npc then
			local position = npc:getPosition()
			npc:remove()
			if position then
				position:sendMagicEffect(CONST_ME_POFF)
			end
		end
	end, 1 * 1000)
end


npcType.onDisappear = function(npc, creature)
    npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
    npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
    npcHandler:onSay(npc, creature, type, message)
--[[
    -- Verifica se a mensagem é "bye"
    if message:lower() == "bye" and creature:isPlayer() then
        removeNpc(npc) -- Remove o NPC
    end
]]
end

npcType.onCloseChannel = function(npc, creature)
	--[[
    -- Verifica se o jogador está fechando a interação
    if creature:isPlayer() then
        removeNpc(npc) -- Remove o NPC
    end
	]]
end

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = LootShopConfig

local function creatureSayCallback(npc, player, type, message)
    local categoryTable = LootShopConfigTable[message:lower()]
    if categoryTable then
        local remainingCategories = npc:getRemainingShopCategories(message:lower(), LootShopConfigTable)
        npc:openShopWindowTable(player, categoryTable)
    end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
    npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end

npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
    player:sendTextMessage(MESSAGE_TRADE, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end

npcType.onCheckItem = function(npc, player, clientId, subType) end

npcType:register(npcConfig)
