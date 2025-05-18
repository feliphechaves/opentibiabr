local config = {
	boss = {
		name = "Arbaziloth",
		position = Position(34068, 32334, 14),
	},
	requiredLevel = 5000,
	timeToFightAgain = ParseDuration("20h") / ParseDuration("1s"),
	playerPositions = {
		{ pos = Position(34058, 32396, 14), teleport = Position(34067, 32342, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34058, 32397, 14), teleport = Position(34067, 32342, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34058, 32398, 14), teleport = Position(34067, 32342, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34058, 32399, 14), teleport = Position(34067, 32342, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34058, 32400, 14), teleport = Position(34067, 32342, 14), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(34054, 32322, 14),
		to = Position(34081, 32347, 14),
	},
	exit = Position(34060, 32334, 14),
}

local lever = BossLever(config)
lever:position(Position(34058, 32395, 14))
lever:register()
