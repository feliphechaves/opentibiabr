local config = {
	[1] = {
		teleportPosition = {x = 1494, y = 1076, z = 9},
		bossName = "Sugar Daddy",
		requiredLevel = 1000,
		timeToFightAgain = 20, -- In hour
		timeToDefeat = 10, -- In minutes
		destination = Position(1469, 1115, 9),
		bossPosition = Position(1468, 1100, 9),
		specPos = {
			from = Position(1453, 1089, 9),
			to = Position(1486, 1123, 9),
		},
		exitPosition = Position(1469, 1117, 9),
	},
}

local teleportBoss = MoveEvent()
function teleportBoss.onStepIn(creature, item, position, fromPosition)
	if not creature or not creature:isPlayer() then
		return false
	end
	for index, value in pairs(config) do
		if Tile(position) == Tile(value.teleportPosition) then
			if not value.specPos then
				creature:teleportTo(value.exitPosition)
				creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				return true
			end
			local spec = Spectators()
			spec:setOnlyPlayer(false)
			spec:setRemoveDestination(value.exitPosition)
			spec:setCheckPosition(value.specPos)
			spec:check()
			if spec:getPlayers() > 0 then
				creature:teleportTo(fromPosition, true)
				creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				creature:say("There's someone fighting with " .. value.bossName .. ".", TALKTYPE_MONSTER_SAY)
				return true
			end
			if creature:getLevel() < value.requiredLevel then
				creature:teleportTo(fromPosition, true)
				creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "All the players need to be level " .. value.requiredLevel .. " or higher.")
				return true
			end
			if not creature:canFightBoss(value.bossName) then
				creature:teleportTo(fromPosition, true)
				creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have to wait " .. value.timeToFightAgain .. " hours to face " .. value.bossName .. " again!")
				return true
			end
			spec:removeMonsters()
			local monster = Game.createMonster(value.bossName, value.bossPosition, true, true)
			if not monster then
				return true
			end
			creature:teleportTo(value.destination)
			creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			creature:setBossCooldown(value.bossName, os.time() + value.timeToFightAgain * 3600)
			creature:sendBosstiaryCooldownTimer()
			addEvent(function()
				spec:clearCreaturesCache()
				spec:setOnlyPlayer(true)
				spec:check()
				spec:removePlayers()
			end, value.timeToDefeat * 60 * 1000)
		end
	end
end

for index, value in pairs(config) do
	teleportBoss:position(value.teleportPosition)
end

teleportBoss:type("stepin")
teleportBoss:register()
