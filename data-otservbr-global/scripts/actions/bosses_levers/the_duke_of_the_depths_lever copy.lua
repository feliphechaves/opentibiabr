local config = {
	boss = {
		name = "The Duke of the Depths",
		position = Position(1217, 1034, 10),
	},
	requiredLevel = 500,
	timeToFightAgain = ParseDuration("12h") / ParseDuration("1s"),
	playerPositions = {
		{ pos = Position(1258, 999, 10), teleport = Position(1223, 1036, 10), effect = CONST_ME_TELEPORT },
		{ pos = Position(1258, 1000, 10), teleport = Position(1223, 1036, 10), effect = CONST_ME_TELEPORT },
		{ pos = Position(1258, 1001, 10), teleport = Position(1223, 1036, 10), effect = CONST_ME_TELEPORT },
		{ pos = Position(1258, 1002, 10), teleport = Position(1223, 1036, 10), effect = CONST_ME_TELEPORT },
		{ pos = Position(1258, 1003, 10), teleport = Position(1223, 1036, 10), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(1206, 1024, 10),
		to = Position(1228, 1044, 10),
	},
	exit = Position(1225, 1034, 10),
}

local lever = BossLever(config)
lever:position(Position(1258, 998, 10))
lever:register()
