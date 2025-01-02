local config = {
	boss = {
		name = "Chagorz",
		position = Position(33044, 32361, 15),
	},
	requiredLevel = 1500,
	timeToFightAgain = ParseDuration("20h") / ParseDuration("1s"),
	playerPositions = {
		{ pos = Position(33078, 32367, 15), teleport = Position(33044, 32373, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33077, 32367, 15), teleport = Position(33044, 32373, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33076, 32367, 15), teleport = Position(33044, 32373, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33075, 32367, 15), teleport = Position(33044, 32373, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33074, 32367, 15), teleport = Position(33044, 32373, 15), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(33033, 32356, 15),
		to = Position(33053, 32378, 15),
	},
	exit = Position(33044, 32375, 15),
}

local lever = BossLever(config)
lever:position(Position(33079, 32367, 15))
lever:register()
