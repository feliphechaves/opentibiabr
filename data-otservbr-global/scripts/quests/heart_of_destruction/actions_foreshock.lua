local config = {
	boss = {
		name = "Realityquake",
		position = Position(32208, 31248, 14),
	},
	playerPositions = {
		{ pos = Position(32182, 31244, 14), teleport = Position(32208, 31256, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32182, 31245, 14), teleport = Position(32208, 31256, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32182, 31246, 14), teleport = Position(32208, 31256, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32182, 31247, 14), teleport = Position(32208, 31256, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32182, 31248, 14), teleport = Position(32208, 31256, 14), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(32197, 31236, 14),
		to = Position(32220, 31260, 14),
	},
	monsters = {
		{ name = "Spark of Destruction", pos = Position(32203, 31246, 14) },
		{ name = "Spark of Destruction", pos = Position(32205, 31251, 14) },
		{ name = "Spark of Destruction", pos = Position(32210, 31251, 14) },
		{ name = "Spark of Destruction", pos = Position(32212, 31246, 14) },
	},
	exit = Position(32230, 31358, 11),
}

local lever = BossLever(config)
lever:position(Position(32182, 31243, 14))
lever:register()
