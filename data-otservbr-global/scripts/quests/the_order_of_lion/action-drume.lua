local config = {
	boss = {
		name = "Drume",
		position = Position(32444, 32516, 7),
	},
	playerPositions = {
		{ pos = Position(32457, 32508, 6), teleport = Position(32451, 32510, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(32458, 32508, 6), teleport = Position(32451, 32510, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(32459, 32508, 6), teleport = Position(32451, 32510, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(32460, 32508, 6), teleport = Position(32451, 32510, 7), effect = CONST_ME_TELEPORT },
		{ pos = Position(32461, 32508, 6), teleport = Position(32451, 32510, 7), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(32416, 32504, 7),
		to = Position(32453, 32537, 7),
	},
	exit = Position(32453, 32507, 7),
}

local lever = BossLever(config)
lever:position(Position(32456, 32508, 6))
lever:register()
