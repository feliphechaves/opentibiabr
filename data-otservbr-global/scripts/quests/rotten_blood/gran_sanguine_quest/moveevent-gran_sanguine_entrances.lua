local moveEvent = MoveEvent()

function moveEvent.onStepIn(creature, item, position, fromPosition)
	if not creature:isPlayer() then
		return true
	end

	local player = creature:getPlayer()
	-- Permite passagem se for Game Master ou cargo superior
	if player:getGroup():getId() >= GROUP_TYPE_GAMEMASTER then
		return true
	end

	if player:getLevel() < 10000 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to be at least level 10.000 to enter this area.")
		player:teleportTo(fromPosition, true)
		return false
	end

	return true
end

-- Registra o moveEvent para cada posição específica
moveEvent:position({ x = 1066, y = 972, z = 7 })
moveEvent:position({ x = 1069, y = 972, z = 7 })
moveEvent:position({ x = 1072, y = 972, z = 7 })
moveEvent:position({ x = 1075, y = 972, z = 7 })
moveEvent:position({ x = 1078, y = 972, z = 7 })
moveEvent:position({ x = 1081, y = 972, z = 7 })

moveEvent:type("stepin")
moveEvent:register()
