local config = {
	boss = {
		name = "Mitmah Vanguard",
		position = Position(34067, 31407, 11),
	},
	requiredLevel = 1500,
	timeToFightAgain = ParseDuration("20h") / ParseDuration("1s"),
	playerPositions = {
		{ pos = Position(34048, 31431, 11), teleport = Position(34067, 31414, 11), effect = CONST_ME_TELEPORT },
		{ pos = Position(34049, 31431, 11), teleport = Position(34067, 31414, 11), effect = CONST_ME_TELEPORT },
		{ pos = Position(34050, 31431, 11), teleport = Position(34067, 31414, 11), effect = CONST_ME_TELEPORT },
		{ pos = Position(34051, 31431, 11), teleport = Position(34067, 31414, 11), effect = CONST_ME_TELEPORT },
		{ pos = Position(34052, 31431, 11), teleport = Position(34067, 31414, 11), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(34052, 31395, 11),
		to = Position(34083, 31420, 11),
	},
	exit = Position(34068, 31418, 11),
}

local lever = BossLever(config)
lever:position(Position(34047, 31431, 11))
lever:register()