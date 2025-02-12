local config = {
	actionId = 18562, -- on lever
	lever = {
		left = 2772,
		right = 2773,
	},
	playItem = {
		itemId = 22722, -- item required to pull lever
		count = 1,
	},
	rouletteOptions = {
		rareItemChance_broadcastThreshold = 700,
		ignoredItems = { 1617 }, -- if you have tables/counters/other items on the roulette tiles, add them here
		winEffects = { CONST_ANI_FIRE, CONST_ME_SOUND_YELLOW, CONST_ME_SOUND_PURPLE, CONST_ME_SOUND_BLUE, CONST_ME_SOUND_WHITE }, -- first effect needs to be distance effect
		effectDelay = 333,
		spinTime = { min = 8, max = 12 }, -- seconds
		spinSlowdownRamping = 5,
		rouletteStorage = 48550, -- required storage to avoid player abuse (if they logout/die before roulette finishes.. they can spin again for free)
	},
	prizePool = {
		--[[
        {itemId = 3043, count = {1, 10},   chance = 10000}, -- {itemId = itemid, count = {min, max}, chance = chance/10000} (crystal coins)
        {itemId = 3382, count = {1, 1},    chance = 9000 }, -- crown legs
        {itemId = 3079, count = {1, 1},    chance = 8500 }, -- boots of haste
        {itemId = 3392, count = {1, 1},    chance = 7500 }, -- royal helmet
        {itemId = 3155, count = {1, 70},   chance = 6500 }, -- sudden death rune -- runes are given as stackable items, even tho they have 'charges'
        {itemId = 25718, count = {50, 100}, chance = 5000 }, -- temple teleport scroll     -- items with 'charges' and have 'showCharges' in items.xml will be given charges
        {itemId = 5957, count = {1, 3},    chance = 4000 }, -- roulette token
        {itemId = 3364, count = {1, 1},    chance = 3000 }, -- golden legs
        {itemId = 3366, count = {1, 1},    chance = 1500 }, -- magic plate armor
        {itemId = 3555, count = {1, 1},    chance = 500  },  -- golden boots]]

		--drop hard
		{ itemId = 36725, count = { 1, 1 }, chance = 1500 }, -- stamina refill
		{ itemId = 36727, count = { 1, 1 }, chance = 1500 }, -- wealth duplex
		{ itemId = 28720, count = { 1, 1 }, chance = 700 }, -- falcon greaves
		{ itemId = 34109, count = { 1, 1 }, chance = 300 }, -- bag you desire

		--drop mediano
		{ itemId = 28718, count = { 1, 1 }, chance = 1500 }, -- falcon bow
		{ itemId = 34152, count = { 1, 1 }, chance = 1500 }, -- lion wand
		{ itemId = 30400, count = { 1, 1 }, chance = 1500 }, -- cobra rod
		{ itemId = 34253, count = { 1, 1 }, chance = 1500 }, -- lion axe
		{ itemId = 30398, count = { 1, 1 }, chance = 1500 }, -- cobra sword
		{ itemId = 39157, count = { 1, 1 }, chance = 1500 }, -- naga club

		{ itemId = 36728, count = { 1, 1 }, chance = 2500 }, -- bestiary betterment
		{ itemId = 36729, count = { 1, 1 }, chance = 2500 }, -- fire resilience
		{ itemId = 36730, count = { 1, 1 }, chance = 2500 }, -- ice resilience
		{ itemId = 36731, count = { 1, 1 }, chance = 2500 }, -- earth resilience
		{ itemId = 36732, count = { 1, 1 }, chance = 2500 }, -- energy resilience
		{ itemId = 36733, count = { 1, 1 }, chance = 2500 }, -- holy resilience
		{ itemId = 36734, count = { 1, 1 }, chance = 2500 }, -- death resilience
		{ itemId = 36735, count = { 1, 1 }, chance = 2500 }, -- physical resilience

		--drop facil
		{ itemId = 22721, count = { 1, 3 }, chance = 9000 }, -- gold token
	},
	roulettePositions = { -- hard-coded to 7 positions.
		Position(1139, 893, 5),
		Position(1140, 893, 5),
		Position(1141, 893, 5),
		Position(1142, 893, 5), -- position 4 in this list is hard-coded to be the reward location, which is the item given to the player
		Position(1143, 893, 5),
		Position(1144, 893, 5),
		Position(1145, 893, 5),
	},
}

local chancedItems = {} -- used for broadcast. don't edit

local function resetLever(position)
	local lever = Tile(position):getItemById(config.lever.right)
	if lever then
		lever:transform(config.lever.left)
	end
end

local function updateRoulette(newItemInfo)
	local positions = config.roulettePositions
	for i = #positions, 1, -1 do
		local item = Tile(positions[i]):getTopVisibleThing()
		if item and item:getId() ~= Tile(positions[i]):getGround():getId() and not table.contains(config.rouletteOptions.ignoredItems, item:getId()) then
			if i ~= 7 then
				item:moveTo(positions[i + 1])
			else
				item:remove()
			end
		end
	end
	if ItemType(newItemInfo.itemId):getCharges() then
		local item = Game.createItem(newItemInfo.itemId, 1, positions[1])
		item:setAttribute("charges", newItemInfo.count)
	else
		Game.createItem(newItemInfo.itemId, newItemInfo.count, positions[1])
	end
end

local function clearRoulette(newItemInfo)
	local positions = config.roulettePositions
	for i = #positions, 1, -1 do
		local item = Tile(positions[i]):getTopVisibleThing()
		if item and item:getId() ~= Tile(positions[i]):getGround():getId() and not table.contains(config.rouletteOptions.ignoredItems, item:getId()) then
			item:remove()
		end
		if newItemInfo == nil then
			positions[i]:sendMagicEffect(CONST_ME_POFF)
		else
			if ItemType(newItemInfo.itemId):getCharges() then
				local item = Game.createItem(newItemInfo.itemId, 1, positions[i])
				item:setAttribute("charges", newItemInfo.count)
			else
				Game.createItem(newItemInfo.itemId, newItemInfo.count, positions[i])
			end
		end
	end
end

local function chanceNewReward()
	local newItemInfo = { itemId = 0, count = 0 }

	local rewardTable = {}
	while #rewardTable < 1 do
		for i = 1, #config.prizePool do
			if config.prizePool[i].chance >= math.random(10000) then
				rewardTable[#rewardTable + 1] = i
			end
		end
	end

	local rand = math.random(#rewardTable)
	newItemInfo.itemId = config.prizePool[rewardTable[rand]].itemId
	newItemInfo.count = math.random(config.prizePool[rewardTable[rand]].count[1], config.prizePool[rewardTable[rand]].count[2])
	chancedItems[#chancedItems + 1] = config.prizePool[rewardTable[rand]].chance

	return newItemInfo
end

local function initiateReward(leverPosition, effectCounter)
	if effectCounter < #config.rouletteOptions.winEffects then
		effectCounter = effectCounter + 1
		if effectCounter == 1 then
			config.roulettePositions[1]:sendDistanceEffect(config.roulettePositions[4], config.rouletteOptions.winEffects[1])
			config.roulettePositions[7]:sendDistanceEffect(config.roulettePositions[4], config.rouletteOptions.winEffects[1])
		else
			for i = 1, #config.roulettePositions do
				config.roulettePositions[i]:sendMagicEffect(config.rouletteOptions.winEffects[effectCounter])
			end
		end
		if effectCounter == 2 then
			local item = Tile(config.roulettePositions[4]):getTopVisibleThing()
			local newItemInfo = { itemId = item:getId(), count = item:getCount() }
			clearRoulette(newItemInfo)
		end
		addEvent(initiateReward, config.rouletteOptions.effectDelay, leverPosition, effectCounter)
		return
	end
	resetLever(leverPosition)
end

local function rewardPlayer(playerId, leverPosition)
	local player = Player(playerId)
	if not player then
		return
	end

	-- Obter o Thing no topo da posição da roleta
	local thing = Tile(config.roulettePositions[4]):getTopVisibleThing()
	if not thing then
		logger.info("DEBUG - Nenhum objeto encontrado na posição da roleta.")
		return
	end

	-- Verificar se o Thing é um Item e recriar o item a partir do ItemType
	local itemType = ItemType(thing:getId())
	if itemType:getId() == 0 then
		logger.info("DEBUG - ID do item inválido:", thing:getId())
		return
	end

	-- Recriar o item para garantir que ele esteja inicializado corretamente
	local newItem = Game.createItem(itemType:getId(), thing:getCount())
	if not newItem then
		logger.info("DEBUG - Falha ao criar instância do item:", itemType:getName())
		return
	end

	-- Adicionar o novo item ao inventário do jogador
	local addedItem = player:addItem(newItem:getId(), newItem:getCount(), true)
	if not addedItem then
		logger.info("DEBUG - Falha ao adicionar o item ao jogador.")
		return
	end

	-- Atualizar storage da roleta
	player:setStorageValue(config.rouletteOptions.rouletteStorage, -1)

	-- Broadcast para itens raros
	if chancedItems[#chancedItems - 3] and chancedItems[#chancedItems - 3] <= config.rouletteOptions.rareItemChance_broadcastThreshold then
		Game.broadcastMessage("The player " .. player:getName() .. " has won " .. newItem:getName() .. " from the roulette!", MESSAGE_EVENT_ADVANCE)
	end
	logger.info("Player " .. player:getName() .. " has won " .. newItem:getName() .. " from the premium roulette!")
end

local function roulette(playerId, leverPosition, spinTimeRemaining, spinDelay)
	local player = Player(playerId)
	if not player then
		resetLever(leverPosition)
		return
	end

	local newItemInfo = chanceNewReward()
	updateRoulette(newItemInfo)

	if spinTimeRemaining > 0 then
		spinDelay = spinDelay + config.rouletteOptions.spinSlowdownRamping
		addEvent(roulette, spinDelay, playerId, leverPosition, spinTimeRemaining - (spinDelay - config.rouletteOptions.spinSlowdownRamping), spinDelay)
		return
	end

	initiateReward(leverPosition, 0)
	rewardPlayer(playerId, leverPosition)
end

local casinoRoulette = Action()

function casinoRoulette.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item:getId() == config.lever.right then
		player:sendTextMessage(MESSAGE_FAILURE, "Casino Roulette is currently in progress. Please wait.")
		return true
	end

	if player:getItemCount(config.playItem.itemId) < config.playItem.count then
		if player:getStorageValue(config.rouletteOptions.rouletteStorage) < 1 then
			player:sendTextMessage(MESSAGE_FAILURE, "Casino Roulette requires " .. config.playItem.count .. " " .. (ItemType(config.playItem.itemId):getName()) .. " to use.")
			return true
		end
		-- player:sendTextMessage(MESSAGE_FAILURE, "Free Spin being used due to a previous unforeseen error.")
	end

	item:transform(config.lever.right)
	clearRoulette()
	chancedItems = {}

	player:removeItem(config.playItem.itemId, config.playItem.count)
	player:setStorageValue(config.rouletteOptions.rouletteStorage, 1)

	local spinTimeRemaining = math.random((config.rouletteOptions.spinTime.min * 1000), (config.rouletteOptions.spinTime.max * 1000))
	roulette(player:getId(), toPosition, spinTimeRemaining, 100)
	return true
end

casinoRoulette:aid(config.actionId)
casinoRoulette:register()

local disableMovingItemsToRoulettePositions = MoveEvent()

disableMovingItemsToRoulettePositions.onAddItem = function(moveitem, tileitem, position, item, count, fromPosition, toPosition)
	for v, k in pairs(config.roulettePositions) do
		if toPosition == k then
			return false
		end
	end
	return true
end

disableMovingItemsToRoulettePositions:position(config.roulettePositions)
disableMovingItemsToRoulettePositions:register()

local resetroulette = TalkAction("/resetroulette")

function resetroulette.onSay(player, words, param)
	-- create log
	logCommand(player, words, param)

	resetLever(Position(1142, 895, 5))
	clearRoulette()

	rouletteActive = false

	return true
end

resetroulette:separator(" ")
resetroulette:groupType("gamemaster")
resetroulette:register()
