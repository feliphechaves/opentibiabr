local internalNpcName = "House"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 128,
	lookHead = 115,
	lookBody = 0,
	lookLegs = 67,
	lookFeet = 114,
	lookAddons = 0,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "Selling house things!" },
}

npcConfig.shop = {
	--equipments
	{ itemName = "blood herb", clientId = 3734, buy = 3000000 },
	{ itemName = "blue christmas bundle", clientId = 6507, buy = 3000000 },
	{ itemName = "blue christmas garland", clientId = 6504, buy = 3000000 },
	{ itemName = "christmas branch", clientId = 6488, buy = 3000000 },
	{ itemName = "christmas card", clientId = 6387, buy = 3000000 },
	{ itemName = "christmas garland", clientId = 6502, buy = 3000000 },
	{ itemName = "christmas present green", clientId = 6509, buy = 3000000 },
	{ itemName = "christmas present red", clientId = 6505, buy = 3000000 },
	{ itemName = "christmas tree package", clientId = 2812, buy = 100000000 },
	{ itemName = "christmas wreath", clientId = 6501, buy = 3000000 },
	{ itemName = "green christmas bundle", clientId = 6508, buy = 3000000 },
	{ itemName = "red christmas bundle", clientId = 6506, buy = 3000000 },
	{ itemName = "red christmas garland", clientId = 6503, buy = 3000000 },
	{ itemName = "Assassin Doll", clientId = 28897, buy = 90000000 },
	{ itemName = "Bookworm Doll", clientId = 28895, buy = 90000000 },
	{ itemName = "Citizen Doll", clientId = 43511, buy = 90000000 },
	{ itemName = "Crimson Doll", clientId = 25981, buy = 90000000 },
	{ itemName = "Draken Doll", clientId = 25979, buy = 90000000 },
	{ itemName = "Little Adventurer Doll", clientId = 37058, buy = 90000000 },
	{ itemName = "Loremaster Doll", clientId = 31267, buy = 90000000 },
	{ itemName = "Norseman Doll", clientId = 19150, buy = 90000000 },
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
