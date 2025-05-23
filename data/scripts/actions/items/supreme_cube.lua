local supremeCube = Action()

local config = {
	price = 100000,
	storage = 9007,
	cooldown = 60,
	towns = {
		{ name = "Thais", teleport = Position(32369, 32241, 7) },
		{ name = "Ab'Dendriel", teleport = Position(32732, 31634, 7) },
		{ name = "Ankrahmun", teleport = Position(33194, 32853, 8) },
		{ name = "Carlin", teleport = Position(32360, 31782, 7) },
		{ name = "Darashia", teleport = Position(33213, 32454, 1) },
		{ name = "Edron", teleport = Position(33217, 31814, 8) },
		{ name = "Farmine", teleport = Position(33023, 31521, 11) },
		{ name = "Issavi", teleport = Position(33921, 31477, 5) },
		{ name = "Kazordoon", teleport = Position(32649, 31925, 11) },
		{ name = "Krailos", teleport = Position(33657, 31665, 8) },
		{ name = "Liberty Bay", teleport = Position(32317, 32826, 7) },
		{ name = "Marapur", teleport = Position(33842, 32853, 7) },
		{ name = "Port Hope", teleport = Position(32594, 32745, 7) },
		{ name = "Rathleton", teleport = Position(33594, 31899, 6) },
		{ name = "Roshamuul", teleport = Position(33513, 32363, 6) },
		{ name = "Svargrond", teleport = Position(32212, 31132, 7) },
		{ name = "Venore", teleport = Position(32957, 32076, 7) },
		{ name = "Yalahar", teleport = Position(32787, 31276, 7) },
	},
}

local function supremeCubeMessage(player, effect, message)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, message)
	player:getPosition():sendMagicEffect(effect)
end

local function windowChoice(window, player, town, price)
	window:addChoice(town.name, function(player, button, choice)
		if button.name == "Select" then
			player:teleportTo(town.teleport, true)
			player:removeMoneyBank(price)
			supremeCubeMessage(player, CONST_ME_TELEPORT, "Welcome to " .. town.name)
			player:setStorageValue(config.storage, os.time() + config.cooldown)
		end
		return true
	end)
end

function supremeCube.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	--local inPz = player:getTile():hasFlag(TILESTATE_PROTECTIONZONE)
	--local inFight = player:isPzLocked() or player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT)
	local house = player:getHouse()

	local price = config.price
	if player:isVip() then
		price = config.price * 0.8 --vip player has 20% discount on teleport use
	end

	--if not inPz and inFight then
	--    supremeCubeMessage(player, CONST_ME_POFF, "You can't use this when you're in a fight.")
	--    return false
	--end

	if player:getMoney() + player:getBankBalance() < price then
		supremeCubeMessage(player, CONST_ME_POFF, "You don't have enought money.")
		return false
	end

	if player:getStorageValue(config.storage) > os.time() then
		local remainingTime = player:getStorageValue(config.storage) - os.time()
		supremeCubeMessage(player, CONST_ME_POFF, "You can use it again in: " .. remainingTime .. " seconds.")
		return false
	end

	local window = ModalWindow({
		title = "Supreme Cube",
		message = "Select a City - Price: " .. price .. " golds.",
	})

	if player:isVip() then
		windowChoice(window, player, { name = "Hunts Teleport", teleport = Position(1063, 1024, 7) }, price)
		windowChoice(window, player, { name = "Boss Room", teleport = Position(1242, 1014, 0) }, price)
		windowChoice(window, player, { name = "NPC Island", teleport = Position(991, 1031, 7) }, price)
	end

	if house ~= nil then
		windowChoice(window, player, { name = "House", teleport = house:getExitPosition() }, price)
	end

	for _, town in pairs(config.towns) do
		if town.name then
			windowChoice(window, player, town, price)
		end
	end

	window:addButton("Select")
	window:addButton("Close")
	window:setDefaultEnterButton(0)
	window:setDefaultEscapeButton(1)
	window:sendToPlayer(player)

	return true
end

supremeCube:id(31633)
supremeCube:register()
