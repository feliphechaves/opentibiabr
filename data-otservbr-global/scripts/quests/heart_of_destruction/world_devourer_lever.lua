local config = {
	boss = {
		name = "World Devourer",
		position = Position(32271, 31347, 14),
	},
	requiredLevel = 250,
	playerPositions = {
		{ pos = Position(32272, 31374, 14), teleport = Position(32271, 31357, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32272, 31375, 14), teleport = Position(32271, 31357, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32272, 31376, 14), teleport = Position(32271, 31357, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32272, 31377, 14), teleport = Position(32271, 31357, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32272, 31378, 14), teleport = Position(32271, 31357, 14), effect = CONST_ME_TELEPORT },

		{ pos = Position(32271, 31374, 14), teleport = Position(32271, 31357, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32271, 31375, 14), teleport = Position(32271, 31357, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32271, 31376, 14), teleport = Position(32271, 31357, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32271, 31377, 14), teleport = Position(32271, 31357, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32271, 31378, 14), teleport = Position(32271, 31357, 14), effect = CONST_ME_TELEPORT },

		{ pos = Position(32273, 31374, 14), teleport = Position(32271, 31357, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32273, 31375, 14), teleport = Position(32271, 31357, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32273, 31376, 14), teleport = Position(32271, 31357, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32273, 31377, 14), teleport = Position(32271, 31357, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32273, 31378, 14), teleport = Position(32271, 31357, 14), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(32259, 31337, 14),
		to = Position(32282, 31358, 14),
	},
	exit = Position(32270, 31358, 14),
}

local lever = BossLever(config)
lever:position(Position(32272, 31373, 14))
lever:register()
