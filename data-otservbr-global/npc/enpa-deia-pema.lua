local internalNpcName = "Enpa-Deia Pema"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 1817,
	lookHead = 115,
	lookBody = 0,
	lookLegs = 67,
	lookFeet = 114,
	lookAddons = 2,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "Items for monks" },
}

npcConfig.shop = {
	--equipments
	{ itemName = "boots of enlightenment", clientId = 50267, buy = 80000 },
	{ itemName = "coned hat of enlightenment", clientId = 50274, buy = 700000 },
	{ itemName = "fists of enlightenment", clientId = 50271, buy = 20000 },
	{ itemName = "harmony amulet", clientId = 50195, buy = 10000 },
	{ itemName = "jo staff", clientId = 50171, buy = 5000 },
	{ itemName = "legs of enlightenment", clientId = 50269, buy = 400000 },
	{ itemName = "nunchaku of enlightenment", clientId = 50273, buy = 500000 },
	{ itemName = "plain monk robe", clientId = 50257, buy = 4500 },
	{ itemName = "robe of enlightenment", clientId = 50268, buy = 700000 },
	{ itemName = "sai of enlightenment", clientId = 50272, buy = 700000 },
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

local function greetCallback(npc, creature, message)
	npcHandler:setInteraction(npc, creature)
	return true
end

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end
	return true
end

local function onTradeRequest(npc, creature)
	return true
end

npcHandler:setMessage(MESSAGE_FAREWELL, "Bye!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Bye.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "At your service.")

npcHandler:setCallback(CALLBACK_ON_TRADE_REQUEST, onTradeRequest)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_TRADE, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcHandler:setMessage(MESSAGE_GREET, "Hello, Player! How may I be of service? Do you wish to {trade} some item?")
npcType.onCheckItem = function(npc, player, clientId, subType) end

npcType:register(npcConfig)
