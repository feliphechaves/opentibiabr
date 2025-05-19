local config = {
	boss = {
		name = "Malvaroth",
		position = Position(34149, 32427, 14),
	},
	requiredLevel = 5000,
	timeToFightAgain = ParseDuration("20h") / ParseDuration("1s"),
	playerPositions = {
		{ pos = Position(34144, 32396, 14), teleport = Position(34150, 32438, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34144, 32397, 14), teleport = Position(34150, 32438, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34144, 32398, 14), teleport = Position(34150, 32438, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34144, 32399, 14), teleport = Position(34150, 32438, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34144, 32400, 14), teleport = Position(34150, 32438, 14), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(34134, 32418, 14),
		to = Position(34161, 32444, 14),
	},
	exit = Position(34158, 32431, 14),
}

local lever = BossLever(config)
lever:position(Position(34144, 32395, 14))
lever:register()
