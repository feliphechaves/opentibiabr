local config = {
	boss = {
		name = "Gralvalon",
		position = Position(34089, 32427, 14),
	},
	requiredLevel = 5000,
	timeToFightAgain = ParseDuration("20h") / ParseDuration("1s"),
	playerPositions = {
		{ pos = Position(34089, 32396, 14), teleport = Position(34089, 32437, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34089, 32397, 14), teleport = Position(34089, 32437, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34089, 32398, 14), teleport = Position(34089, 32437, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34089, 32399, 14), teleport = Position(34089, 32437, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34089, 32400, 14), teleport = Position(34089, 32437, 14), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(34073, 32422, 14),
		to = Position(34099, 32443, 14),
	},
	exit = Position(34097, 32431, 14),
}

local lever = BossLever(config)
lever:position(Position(34089, 32395, 14))
lever:register()
