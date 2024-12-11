local config = {
	boss = {
		name = "The Baron From Below",
		position = Position(1217, 1009, 10),
	},
	requiredLevel = 500,
	timeToFightAgain = ParseDuration("20h") / ParseDuration("1s"),
	playerPositions = {
		{ pos = Position(1244, 999, 10), teleport = Position(1218, 1016, 10), effect = CONST_ME_TELEPORT },
		{ pos = Position(1244, 1000, 10), teleport = Position(1218, 1016, 10), effect = CONST_ME_TELEPORT },
		{ pos = Position(1244, 1001, 10), teleport = Position(1218, 1016, 10), effect = CONST_ME_TELEPORT },
		{ pos = Position(1244, 1002, 10), teleport = Position(1218, 1016, 10), effect = CONST_ME_TELEPORT },
		{ pos = Position(1244, 1003, 10), teleport = Position(1218, 1016, 10), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(1209, 1001, 10),
		to = Position(1227, 1021, 10),
	},
	exit = Position(1219, 1019, 10),
}

local lever = BossLever(config)
lever:position(Position(1244, 998, 10))
lever:register()
