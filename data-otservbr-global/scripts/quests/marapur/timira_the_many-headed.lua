local config = {
	boss = {
		name = "Timira the Many-Headed",
		position = Position(33815, 32704, 9),
	},
	requiredLevel = 1500,
	playerPositions = {
		{ pos = Position(33809, 32702, 8), teleport = Position(33810, 32704, 9), effect = CONST_ME_TELEPORT },
		{ pos = Position(33808, 32702, 8), teleport = Position(33810, 32704, 9), effect = CONST_ME_TELEPORT },
		{ pos = Position(33807, 32702, 8), teleport = Position(33810, 32704, 9), effect = CONST_ME_TELEPORT },
		{ pos = Position(33806, 32702, 8), teleport = Position(33810, 32704, 9), effect = CONST_ME_TELEPORT },
		{ pos = Position(33805, 32702, 8), teleport = Position(33810, 32704, 9), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(33767, 32661, 9),
		to = Position(33830, 32720, 9),
	},
	exit = Position(33816, 32710, 9),
}

local lever = BossLever(config)
lever:position(Position(33810, 32702, 8))
lever:register()
