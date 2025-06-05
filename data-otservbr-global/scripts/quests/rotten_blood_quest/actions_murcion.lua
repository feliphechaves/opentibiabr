local config = {
	boss = {
		name = "Murcion",
		position = Position(33009, 32362, 15),
	},
	requiredLevel = 1500,
	timeToFightAgain = ParseDuration("12h") / ParseDuration("1s"),
	playerPositions = {
		{ pos = Position(32978, 32365, 15), teleport = Position(33009, 32371, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(32977, 32365, 15), teleport = Position(33009, 32371, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(32976, 32365, 15), teleport = Position(33009, 32371, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(32975, 32365, 15), teleport = Position(33009, 32371, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(32974, 32365, 15), teleport = Position(33009, 32371, 15), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(32997, 32357, 15),
		to = Position(33020, 32376, 15),
	},
	exit = Position(33009, 32374, 15),
}

local lever = BossLever(config)
lever:position(Position(32979, 32365, 15))
lever:register()
