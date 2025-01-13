local config = {
	actionId = 18563, -- on lever
	lever = {
		left = 21126,
		right = 21130,
	},
	playItem = {
		itemId = 39036, -- item required to pull lever
		count = 1,
	},
	rouletteOptions = {
		rareItemChance_broadcastThreshold = 1000,
		ignoredItems = { 1617 }, -- if you have tables/counters/other items on the roulette tiles, add them here
		winEffects = { CONST_ANI_FIRE, CONST_ME_SOUND_YELLOW, CONST_ME_SOUND_PURPLE, CONST_ME_SOUND_BLUE, CONST_ME_SOUND_WHITE }, -- first effect needs to be distance effect
		effectDelay = 333,
		spinTime = { min = 8, max = 12 }, -- seconds
		spinSlowdownRamping = 5,
		rouletteStorage = 48551, -- required storage to avoid player abuse (if they logout/die before roulette finishes.. they can spin again for free)
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

		{ itemId = 22721, count = { 1, 25 }, chance = 2500 }, -- gold token
		{ itemId = 3423, count = { 1, 1 }, chance = 2500 }, -- blessed shield
		{ itemId = 3363, count = { 1, 1 }, chance = 2500 }, -- dragon scale legs
		{ itemId = 3400, count = { 1, 1 }, chance = 2500 }, -- dragon scale helmet
		{ itemId = 3390, count = { 1, 1 }, chance = 2500 }, -- horned helmet
		{ itemId = 39546, count = { 1, 1 }, chance = 2500 }, -- primal bag
		--{itemId = 34109, count = {1, 1}, chance = 2500},  -- bag you desire
		{ itemId = 3365, count = { 1, 1 }, chance = 2500 }, -- golden helmet
		{ itemId = 3368, count = { 1, 1 }, chance = 2500 }, -- winged helmet
		--{itemId = 9219, count = {1, 1}, chance = 1500},   -- charm points

		--{itemId = 28897, count = {1, 1}, chance = 1500},  -- addon doll
		{ itemId = 11685, count = { 1, 5 }, chance = 1500 }, -- stamina refill
		{ itemId = 49600, count = { 1, 1 }, chance = 1500 }, --infinite food
		{ itemId = 43895, count = { 1, 1 }, chance = 1400 }, -- bag you desire
		{ itemId = 39036, count = { 1, 2 }, chance = 1200 }, -- cassino coin
		{ itemId = 14758, count = { 1, 2 }, chance = 1200 }, -- vip scroll

		--sanguines
		{ itemId = 43864, count = { 1, 1 }, chance = 1000 },
		{ itemId = 43866, count = { 1, 1 }, chance = 1000 },
		{ itemId = 43868, count = { 1, 1 }, chance = 1000 },
		{ itemId = 43870, count = { 1, 1 }, chance = 1000 },
		{ itemId = 43872, count = { 1, 1 }, chance = 1000 },
		{ itemId = 43874, count = { 1, 1 }, chance = 1000 },
		{ itemId = 43876, count = { 1, 1 }, chance = 1000 },
		{ itemId = 43877, count = { 1, 1 }, chance = 1000 }, --sanguine bow
		{ itemId = 43879, count = { 1, 1 }, chance = 1000 },
		{ itemId = 43881, count = { 1, 1 }, chance = 1000 }, --sanguine greaves
		{ itemId = 43882, count = { 1, 1 }, chance = 1000 },
		{ itemId = 43884, count = { 1, 1 }, chance = 1000 },
		{ itemId = 43885, count = { 1, 1 }, chance = 1000 },
		{ itemId = 43887, count = { 1, 1 }, chance = 1000 },

		{ itemId = 31633, count = { 1, 1 }, chance = 900 }, --supreme cube

		{ itemId = 21292, count = { 1, 1 }, chance = 400 }, -- aiolos backpack
		{ itemId = 49284, count = { 1, 1 }, chance = 400 },
		{ itemId = 49285, count = { 1, 1 }, chance = 400 },
		{ itemId = 49286, count = { 1, 1 }, chance = 400 },
		{ itemId = 49287, count = { 1, 1 }, chance = 400 },
		{ itemId = 49288, count = { 1, 1 }, chance = 400 },
		{ itemId = 49288, count = { 1, 1 }, chance = 400 },
		{ itemId = 49289, count = { 1, 1 }, chance = 400 },

		{ itemId = 23488, count = { 1, 1 }, chance = 500 }, --grand sanguine box

		--grand sanguine
		{ itemId = 43865, count = { 1, 1 }, chance = 500 },
		{ itemId = 43867, count = { 1, 1 }, chance = 500 },
		{ itemId = 43869, count = { 1, 1 }, chance = 500 },
		{ itemId = 43871, count = { 1, 1 }, chance = 500 },
		{ itemId = 43873, count = { 1, 1 }, chance = 500 },
		{ itemId = 43875, count = { 1, 1 }, chance = 500 },
		{ itemId = 43878, count = { 1, 1 }, chance = 500 },
		{ itemId = 43880, count = { 1, 1 }, chance = 500 },
		{ itemId = 43883, count = { 1, 1 }, chance = 500 },
		{ itemId = 43886, count = { 1, 1 }, chance = 500 },
		{ itemId = 43883, count = { 1, 1 }, chance = 500 },
	},
	roulettePositions = { -- hard-coded to 7 positions.
		Position(1188, 896, 5),
		Position(1189, 896, 5),
		Position(1190, 896, 5),
		Position(1191, 896, 5), -- position 4 in this list is hard-coded to be the reward location, which is the item given to the player
		Position(1192, 896, 5),
		Position(1193, 896, 5),
		Position(1194, 896, 5),
	},
}

local rouletteActive = false

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
	local count = newItem:getCount()
	if newItem:getId() == 22721 then
		count = math.random(5, 25)
	end
	local addedItem = player:addItem(newItem:getId(), count, true)
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

	rouletteActive = false
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

local casinoRouletteVip = Action()

function casinoRouletteVip.onUse(player, item, fromPosition, target, toPosition, isHotkey)
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

	if rouletteActive then
		player:sendTextMessage(MESSAGE_FAILURE, "The roulette is in progress. Please wait.")
		return true
	end

	-- Iniciar a roleta
	rouletteActive = true

	item:transform(config.lever.right)
	clearRoulette()
	chancedItems = {}

	player:removeItem(config.playItem.itemId, config.playItem.count)
	player:setStorageValue(config.rouletteOptions.rouletteStorage, 1)

	local spinTimeRemaining = math.random((config.rouletteOptions.spinTime.min * 1000), (config.rouletteOptions.spinTime.max * 1000))
	roulette(player:getId(), toPosition, spinTimeRemaining, 100)
	return true
end

casinoRouletteVip:aid(config.actionId)
casinoRouletteVip:register()

local resetroulettevip = TalkAction("/resetroulettevip")

function resetroulettevip.onSay(player, words, param)
	-- create log
	logCommand(player, words, param)

	resetLever(Position(1191, 899, 5))
	clearRoulette()

	return true
end

resetroulettevip:separator(" ")
resetroulettevip:groupType("gamemaster")
resetroulettevip:register()
