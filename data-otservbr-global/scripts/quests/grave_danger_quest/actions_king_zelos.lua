local config = {
	boss = {
		name = "King Zelos",
		position = Position(33443, 31545, 13),
	},
	requiredLevel = 250,
	playerPositions = {
		{ pos = Position(33485, 31546, 13), teleport = Position(33443, 31554, 13), effect = CONST_ME_TELEPORT },
		{ pos = Position(33485, 31547, 13), teleport = Position(33443, 31554, 13), effect = CONST_ME_TELEPORT },
		{ pos = Position(33485, 31548, 13), teleport = Position(33443, 31554, 13), effect = CONST_ME_TELEPORT },
		{ pos = Position(33485, 31545, 13), teleport = Position(33443, 31554, 13), effect = CONST_ME_TELEPORT },
		{ pos = Position(33485, 31544, 13), teleport = Position(33443, 31554, 13), effect = CONST_ME_TELEPORT },
		{ pos = Position(33486, 31546, 13), teleport = Position(33443, 31554, 13), effect = CONST_ME_TELEPORT },
		{ pos = Position(33486, 31547, 13), teleport = Position(33443, 31554, 13), effect = CONST_ME_TELEPORT },
		{ pos = Position(33486, 31548, 13), teleport = Position(33443, 31554, 13), effect = CONST_ME_TELEPORT },
		{ pos = Position(33486, 31545, 13), teleport = Position(33443, 31554, 13), effect = CONST_ME_TELEPORT },
		{ pos = Position(33486, 31544, 13), teleport = Position(33443, 31554, 13), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(33433, 31535, 13),
		to = Position(33453, 31555, 13),
	},
	exit = Position(32172, 31918, 8),
}

local king_zelos = Action()

function king_zelos.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not player:doCheckBossRoom("King Zelos", config.fromPos, config.toPos) then
		player:sendCancelMessage("The room is already in use. Please wait.")
		return true
	end

	local spectators = Game.getSpectators(config.centerRoom, false, true, config.x, config.x, config.y, config.y)

	if player:getPosition() ~= Position(33485, 31546, 13) then
		player:sendCancelMessage("Sorry, not possible.")
		return true
	end

	if #spectators > 0 then
		player:say("The room is occupied by another team, please wait.", TALKTYPE_MONSTER_SAY, false, player)
		return true
	end

	for _, boss in pairs(config.summons) do
		Game.createMonster(boss.name, boss.pos, false, true)
	end

	for x = 33485, 33486 do
		for y = 31544, 31548 do
			local playerTile = Tile(Position(x, y, 13)):getTopCreature()
			if playerTile and playerTile:isPlayer() then
				playerTile:getPosition():sendMagicEffect(CONST_ME_POFF)
				playerTile:teleportTo(config.newPosition)
				playerTile:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				playerTile:setStorageValue(config.timer, os.time() + 20 * 3600)
				playerTile:setStorageValue(config.room, os.time() + 24 * 60)
				playerTile:say("You have 24 minutes to kill and loot this boss. Otherwise you will lose that chance and will be kicked out.", TALKTYPE_MONSTER_SAY, false, playerTile)
			end
		end
	end

	--addEvent(clearForgotten, 24 * 60 * 1000, config.fromPos, config.toPos, config.exitPos, config.room)

	return true
end

king_zelos:aid(14568)
king_zelos:register()
