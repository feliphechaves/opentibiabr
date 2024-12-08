local config = {
	boss = {
		name = "Anomaly",
		position = Position(32151, 31245, 14),
	},
	playerPositions = {
		{ pos = Position(32125, 31243, 14), teleport = Position(32147, 31249, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32125, 31244, 14), teleport = Position(32147, 31249, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32125, 31245, 14), teleport = Position(32147, 31249, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32125, 31246, 14), teleport = Position(32147, 31249, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32125, 31247, 14), teleport = Position(32147, 31249, 14), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(32139, 31233, 14),
		to = Position(32164, 31258, 14),
	},
	monsters = {
		{ name = "Spark of Destruction", pos = Position(32205, 31251, 14) },
		{ name = "Spark of Destruction", pos = Position(32205, 31245, 14) },
		{ name = "Spark of Destruction", pos = Position(32211, 31245, 14) },
		{ name = "Spark of Destruction", pos = Position(32211, 31250, 14) },
	},
	exit = Position(32199, 31248, 14),
}

local lever = BossLever(config)
lever:position(Position(32125, 31242, 14))
lever:register()
