local config = {
	boss = {
		name = "melting frozen horror",
		position = Position(32269, 31091, 14),
	},
	timeToFightAgain = 20 * 60 * 60,
	playerPositions = {
		{ pos = Position(32302, 31088, 14), teleport = Position(32271, 31097, 14) },
		{ pos = Position(32302, 31089, 14), teleport = Position(32271, 31097, 14) },
		{ pos = Position(32302, 31090, 14), teleport = Position(32271, 31097, 14) },
		{ pos = Position(32302, 31091, 14), teleport = Position(32271, 31097, 14) },
		{ pos = Position(32302, 31092, 14), teleport = Position(32271, 31097, 14) },
	},
	monsters = {},
	specPos = {
		from = Position(32257, 31079, 14),
		to = Position(32281, 31102, 14),
	},
	exit = Position(32272, 31100, 14),
}

leverZyrtarch = BossLever(config)
leverZyrtarch:position(Position(32302, 31087, 14))
leverZyrtarch:register()