local internalNpcName = "Goldoken"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.currency = 22721

npcConfig.outfit = {
	lookType = 80,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.shop = {

	--equipments
	{ itemName = "starlight vial", clientId = 25976, buy = 10 },
	{ itemName = "sun catcher", clientId = 25977, buy = 10 },
	{ itemName = "moon mirror", clientId = 25975, buy = 10 },
	{ itemName = "bone fiddle", clientId = 28493, buy = 10 },
	{ itemName = "magical torch", clientId = 9042, buy = 10 },
	
	--equipments class 4
	{ itemName = "class 4 helmet", clientId = 3395, buy = 5 },
	{ itemName = "class 4 armor", clientId = 37608, buy = 5 },
	{ itemName = "class 4 legs", clientId = 37607, buy = 5 },
	{ itemName = "class 4 weapon", clientId = 3296, buy = 5 },

	--tools
	{ itemName = "obsidian knife", clientId = 5908, buy = 5 },
	{ itemName = "sneaky stabber of eliteness", clientId = 9594, buy = 5 },
	{ itemName = "squeezing gear of girlpower", clientId = 9596, buy = 5 },
	{ itemName = "whacking driller of fate", clientId = 9598, buy = 5 },
	{ itemName = "blessed wooden stake", clientId = 5942, buy = 5 },

	--mount
	{ itemName = "music box", clientId = 16244, buy = 20 },

	--foods
	{ itemName = "blueberry cupcake", clientId = 28484, buy = 3 },
	{ itemName = "carrot cake", clientId = 9087, buy = 3 },
	{ itemName = "roasted dragon wings", clientId = 9081, buy = 3 },
	{ itemName = "rotworm stew", clientId = 9079, buy = 3 },
	{ itemName = "tropical fried terrorbird", clientId = 9082, buy = 3 },
	{ itemName = "veggie casserole", clientId = 9084, buy = 3 }
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

-- Greeting
--keywordHandler:addCustomGreetKeyword({ "djanni'hah" }, greetCallback, { npcHandler = npcHandler })

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
npcType.onCheckItem = function(npc, player, clientId, subType) end

npcType:register(npcConfig)
