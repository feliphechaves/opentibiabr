local config = {
	boss = {
		name = "Gnomevil",
		position = Position(1248, 967, 10),
	},
	requiredLevel = 500,
	timeToFightAgain = ParseDuration("12h") / ParseDuration("1s"),
	playerPositions = {
		{ pos = Position(1251, 989, 10), teleport = Position(1250, 970, 10), effect = CONST_ME_TELEPORT },
		{ pos = Position(1251, 990, 10), teleport = Position(1250, 970, 10), effect = CONST_ME_TELEPORT },
		{ pos = Position(1251, 991, 10), teleport = Position(1250, 970, 10), effect = CONST_ME_TELEPORT },
		{ pos = Position(1251, 992, 10), teleport = Position(1250, 970, 10), effect = CONST_ME_TELEPORT },
		{ pos = Position(1251, 993, 10), teleport = Position(1250, 970, 10), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(1244, 966, 10),
		to = Position(1255, 972, 10),
	},
	exit = Position(1244, 972, 10),
}

local lever = BossLever(config)
lever:position(Position(1251, 988, 10))
lever:register()
