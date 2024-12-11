local config = {
	boss = {
		name = "The Count of the Core",
		position = Position(1217, 987, 10),
	},
	requiredLevel = 500,
	timeToFightAgain = ParseDuration("20h") / ParseDuration("1s"),
	playerPositions = {
		{ pos = Position(1251, 999, 10), teleport = Position(1217, 992, 10), effect = CONST_ME_TELEPORT },
		{ pos = Position(1251, 1000, 10), teleport = Position(1217, 992, 10), effect = CONST_ME_TELEPORT },
		{ pos = Position(1251, 1001, 10), teleport = Position(1217, 992, 10), effect = CONST_ME_TELEPORT },
		{ pos = Position(1251, 1002, 10), teleport = Position(1217, 992, 10), effect = CONST_ME_TELEPORT },
		{ pos = Position(1251, 1003, 10), teleport = Position(1217, 992, 10), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(1206, 983, 10),
		to = Position(1229, 995, 10),
	},
	exit = Position(1217, 994, 10),
}

local lever = BossLever(config)
lever:position(Position(1251, 998, 10))
lever:register()
