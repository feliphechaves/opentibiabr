local config = {
	boss = {
		name = "Ancient Spawn of Morgathla",
		position = Position(1289, 968, 10),
	},
	requiredLevel = 900,
	playerPositions = {
		{ pos = Position(1255, 989, 10), teleport = Position(1286, 970, 10), effect = CONST_ME_TELEPORT },
		{ pos = Position(1255, 990, 10), teleport = Position(1286, 970, 10), effect = CONST_ME_TELEPORT },
		{ pos = Position(1255, 991, 10), teleport = Position(1286, 970, 10), effect = CONST_ME_TELEPORT },
		{ pos = Position(1255, 992, 10), teleport = Position(1286, 970, 10), effect = CONST_ME_TELEPORT },
		{ pos = Position(1255, 993, 10), teleport = Position(1286, 970, 10), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(1283, 964, 10),
		to = Position(1295, 971, 10),
	},
	exit = Position(1284, 971, 10),
}

local lever = BossLever(config)
lever:position(Position(1255, 988, 10))
lever:register()
