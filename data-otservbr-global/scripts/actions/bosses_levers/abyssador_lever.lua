local config = {
	boss = {
		name = "Abyssador",
		position = Position(1270, 965, 10),
	},
	requiredLevel = 500,
	timeToFightAgain = ParseDuration("12h") / ParseDuration("1s"),
	playerPositions = {
		{ pos = Position(1258, 989, 10), teleport = Position(1270, 972, 10), effect = CONST_ME_TELEPORT },
		{ pos = Position(1258, 990, 10), teleport = Position(1270, 972, 10), effect = CONST_ME_TELEPORT },
		{ pos = Position(1258, 991, 10), teleport = Position(1270, 972, 10), effect = CONST_ME_TELEPORT },
		{ pos = Position(1258, 992, 10), teleport = Position(1270, 972, 10), effect = CONST_ME_TELEPORT },
		{ pos = Position(1258, 993, 10), teleport = Position(1270, 972, 10), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(1263, 961, 10),
		to = Position(1277, 975, 10),
	},
	exit = Position(1263, 975, 10),
}

local lever = BossLever(config)
lever:position(Position(1258, 988, 10))
lever:register()
