local config = {
	boss = {
		name = "Maliz",
		position = Position(33265,31420,15),
	},
	requiredLevel = 1500,
	timeToFightAgain = ParseDuration("20h") / ParseDuration("1s"),
	playerPositions = {
		{ pos = Position(33260, 31061, 13), teleport = Position(33259, 31416, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33261, 31061, 13), teleport = Position(33259, 31417, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33262, 31061, 13), teleport = Position(33259, 31418, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33263, 31061, 13), teleport = Position(33259, 31419, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33264, 31061, 13), teleport = Position(33259, 31420, 15), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(33253, 31403, 15),
		to = Position(33277, 31423, 15),
	},
	exit = Position(33259, 31421, 15),
}

local lever = BossLever(config)
lever:position(Position(33259, 31061, 13))
lever:register()
