local config = {
	boss = {
		name = "Deathstrike",
		position = Position(1230, 965, 10),
	},
	requiredLevel = 500,
	timeToFightAgain = ParseDuration("12h") / ParseDuration("1s"),
	playerPositions = {
		{ pos = Position(1244, 989, 10), teleport = Position(1231, 971, 10), effect = CONST_ME_TELEPORT },
		{ pos = Position(1244, 990, 10), teleport = Position(1231, 971, 10), effect = CONST_ME_TELEPORT },
		{ pos = Position(1244, 991, 10), teleport = Position(1231, 971, 10), effect = CONST_ME_TELEPORT },
		{ pos = Position(1244, 992, 10), teleport = Position(1231, 971, 10), effect = CONST_ME_TELEPORT },
		{ pos = Position(1244, 993, 10), teleport = Position(1231, 971, 10), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(1220, 960, 10),
		to = Position(1237, 976, 10),
	},
	exit = Position(1220, 976, 10),
}

local lever = BossLever(config)
lever:position(Position(1244, 988, 10))
lever:register()
