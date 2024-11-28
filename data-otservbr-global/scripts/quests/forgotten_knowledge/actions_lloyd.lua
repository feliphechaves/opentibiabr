local config = {
	boss = {
		name = "Lloyd",
		position = Position(32799, 32827, 14),
	},
	timeToFightAgain = 20 * 60 * 60,
	playerPositions = {
		{ pos = Position(32759, 32872, 14), teleport = Position(32799, 32833, 14) },
		{ pos = Position(32759, 32871, 14), teleport = Position(32799, 32832, 14) },
		{ pos = Position(32759, 32870, 14), teleport = Position(32799, 32832, 14) },
		{ pos = Position(32759, 32869, 14), teleport = Position(32799, 32832, 14) },
		{ pos = Position(32759, 32868, 14), teleport = Position(32799, 32832, 14) },
	},
	monsters = {},
	specPos = {
		from = Position(32785, 32813, 14),
		to = Position(32813, 32839, 14),
	},
	exit = Position(32800, 32836, 14),
}

local leverLloyd = BossLever(config)
leverLloyd:position(Position(32759, 32867, 14))
leverLloyd:register()
