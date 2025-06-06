local config = {
	boss = {
		name = "Lloyd",
		position = Position(32799, 32827, 14),
	},
	requiredLevel = 250,
	playerPositions = {
		{ pos = Position(32759, 32868, 14), teleport = Position(32800, 32831, 14) },
		{ pos = Position(32759, 32869, 14), teleport = Position(32800, 32831, 14) },
		{ pos = Position(32759, 32870, 14), teleport = Position(32800, 32831, 14) },
		{ pos = Position(32759, 32871, 14), teleport = Position(32800, 32831, 14) },
		{ pos = Position(32759, 32872, 14), teleport = Position(32800, 32831, 14) },
	},
	specPos = {
		from = Position(32785, 32813, 14),
		to = Position(32812, 32838, 14),
	},
	exit = Position(32815, 32873, 13),
}

local lever = BossLever(config)
lever:position(Position(32759, 32867, 14))
lever:register()
