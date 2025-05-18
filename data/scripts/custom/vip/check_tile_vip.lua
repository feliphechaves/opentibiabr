local checktilevip = MoveEvent()

function checktilevip.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local playerGroupType = player:getGroup():getId()

	if playerGroupType < GROUP_TYPE_GAMEMASTER and not player:isVip() then
		player:teleportTo(fromPosition, true)
		fromPosition:sendMagicEffect(CONST_ME_HOLYDAMAGE)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are not Vip!")
	end

	return true
end

checktilevip:type("stepin")
checktilevip:aid(59990)
checktilevip:register()

local checkvipportal = MoveEvent()

function checkvipportal.onStepIn(creature, item, position, fromPosition)
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

	local vipteleport = Position(33861, 32413, 6)
	player:teleportTo(vipteleport)
	player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
	return true
end

checkvipportal:type("stepin")
checkvipportal:aid(59991)
checkvipportal:register()
