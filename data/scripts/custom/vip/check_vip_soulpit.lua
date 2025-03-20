local checkvipSoulPit = MoveEvent()

function checkvipSoulPit.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local playerGroupType = player:getGroup():getId()

	if playerGroupType < GROUP_TYPE_GAMEMASTER and not player:isVip() then
		player:teleportTo(fromPosition, true)
		fromPosition:sendMagicEffect(CONST_ME_HOLYDAMAGE)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are not Vip!")
		return true
	end

	local vipteleport = Position(32349, 31033, 3)
	player:teleportTo(vipteleport)
	player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Welcome to Soul Pit!")
	return true
end

checkvipSoulPit:type("stepin")
checkvipSoulPit:uid(12012)
checkvipSoulPit:register()
