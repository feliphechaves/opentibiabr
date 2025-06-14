local internalNpcName = "The Backpacker"
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
	lookHead = 114,
	lookBody = 0,
	lookLegs = 76,
	lookFeet = 94,
	lookAddons = 3,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "Selling backpacks! First-class bargains!" },
}

npcConfig.shop = {
	--equipments
	{ itemName = "jewelled backpack", clientId = 5801, buy = 1000000 },
	{ itemName = "festive backpack", clientId = 30197, buy = 1000000 },
	{ itemName = "book backpack", clientId = 28571, buy = 1000000 },

	{ itemName = "winged backpack", clientId = 31625, buy = 2000000 },
	{ itemName = "pillow backpack", clientId = 24393, buy = 2000000 },
	{ itemName = "energetic backpack", clientId = 23525, buy = 2000000 },
	{ itemName = "backpack of holding", clientId = 3253, buy = 2000000 },

	{ itemName = "25 years backpack", clientId = 39693, buy = 2500000 },

	{ itemName = "lilypad backpack", clientId = 39754, buy = 3000000 },
	{ itemName = "ghost backpack", clientId = 32620, buy = 3000000 },

	{ itemName = "golden backpack", clientId = 2871, buy = 1000 },
	{ itemName = "green backpack", clientId = 2865, buy = 1000 },
	{ itemName = "grey backpack", clientId = 2870, buy = 1000 },
	{ itemName = "orange backpack", clientId = 9602, buy = 1000 },
	{ itemName = "purple backpack", clientId = 2868, buy = 1000 },
	{ itemName = "red backpack", clientId = 2867, buy = 1000 },
	{ itemName = "yellow backpack", clientId = 2866, buy = 1000 },
	{ itemName = "expedition backpack", clientId = 10324, buy = 1000 },
	{ itemName = "buggy backpack", clientId = 14249, buy = 1000 },

	{ itemName = "changing backpack", clientId = 37536, buy = 10000000 },

	{ itemName = "Zaoan chess box", clientId = 18339, buy = 15000000 },
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

	message = message:lower()

	if message == "upgrade" or message == "exchange" then
		local vocationId = player:getVocation():getBaseId()
		local backpacks = {
			[1] = { name = "Necromantic Backpack", itemId = 65033 },
			[2] = { name = "Nature's Backpack", itemId = 65030 },
			[3] = { name = "Celestial Archer Backpack", itemId = 65032 },
			[4] = { name = "Bloodrage Backpack", itemId = 65031 },
			[5] = { name = "Pilgrim Backpack", itemId = 65034 },
		}

		local selected = backpacks[vocationId]
		if not selected then
			npcHandler:say("Your vocation is not eligible for a special backpack.", npc, creature)
			return true
		end

		npcHandler:say("Do you want to trade your Aiolos Backpack (must be equipped), 15 Tibia Coins and 3 Essence of Health for a " .. selected.name .. "? {Warning: any items inside your backpack will be lost!}", npc, creature)
		npcHandler:setTopic(playerId, 1)
		player:setStorageValue(100991, selected.itemId) -- temporariamente guarda o itemId alvo
	elseif message == "yes" and npcHandler:getTopic(player:getId()) == 1 then
		local backpackId = player:getStorageValue(100991)
		if not backpackId or backpackId <= 0 then
			npcHandler:say("Something went wrong. Please start the trade again.", npc, creature)
			return true
		end

		local AIOLOS_ID = 21292
		local TC_ID = 22118
		local ESSENCE_ID = 65020

		local equippedBackpack = player:getSlotItem(CONST_SLOT_BACKPACK)
		if not equippedBackpack or equippedBackpack:getId() ~= AIOLOS_ID then
			npcHandler:say("You must be wearing the Aiolos Backpack to proceed with the upgrade.", npc, creature)
			return true
		end

		local tcItemCount = player:getItemCount(TC_ID)
		local walletCoins = player:getTransferableCoins()
		if tcItemCount + walletCoins < 15 then
			npcHandler:say("You need at least 15 Tibia Coins.", npc, creature)
			return true
		end

		if player:getItemCount(ESSENCE_ID) < 3 then
			npcHandler:say("You need 3 Essences of Health.", npc, creature)
			return true
		end

		player:removeItem(AIOLOS_ID, 1)

		local coinsToRemove = 15
		local removeFromItems = math.min(tcItemCount, coinsToRemove)
		if removeFromItems > 0 then
			player:removeItem(TC_ID, removeFromItems)
			coinsToRemove = coinsToRemove - removeFromItems
		end
		if coinsToRemove > 0 then
			player:removeTransferableCoinsBalance(coinsToRemove)
		end

		player:removeItem(ESSENCE_ID, 1)
		player:addItem(backpackId, 1)

		npcHandler:say("Here's your new backpack. Wear it with pride!", npc, creature)
		npcHandler:setTopic(player:getId(), 0)
		player:setStorageValue(100991, -1)
	elseif message == "no" and npcHandler:getTopic(player:getId()) == 1 then
		npcHandler:say("Alright, maybe another time.", npc, creature)
		npcHandler:setTopic(player:getId(), 0)
		player:setStorageValue(100991, -1)
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
npcHandler:setMessage(MESSAGE_GREET, "Hey |PLAYERNAME|! I sell all kinds of backpacks. To open my shop, say {trade}. To upgrade your Aiolos Backpack, say {upgrade}.")
npcType.onCheckItem = function(npc, player, clientId, subType) end

npcType:register(npcConfig)
