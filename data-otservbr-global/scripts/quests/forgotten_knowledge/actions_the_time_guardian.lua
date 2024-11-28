local config = {
	boss = {
		name = "The Time Guardian",
		position = Position(32977, 31662, 14),
	},
	timeToFightAgain = 20 * 60 * 60,
	playerPositions = {
		{ pos = Position(33010, 31660, 14), teleport = Position(32977, 31667, 14) },
		{ pos = Position(33010, 31661, 14), teleport = Position(32977, 31667, 14) },
		{ pos = Position(33010, 31662, 14), teleport = Position(32977, 31667, 14) },
		{ pos = Position(33010, 31663, 14), teleport = Position(32977, 31667, 14) },
		{ pos = Position(33010, 31664, 14), teleport = Position(32977, 31667, 14) },
	},
	monsters = {
		{ name = "The Freezing Time Guardian", pos = Position(32975, 31662, 14) },
		{ name = "The Blazing Time Guardian", pos = Position(32979, 31662, 14) },
	},
	specPos = {
		from = Position(32965, 31651, 14),
		to = Position(32988, 31674, 14),
	},
	exit = Position(32980, 31672, 14),
}

leverTimeGuardian = BossLever(config)
leverTimeGuardian:position(Position(33010, 31659, 14))
leverTimeGuardian:register()