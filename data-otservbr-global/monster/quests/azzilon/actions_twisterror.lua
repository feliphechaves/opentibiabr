local config = {
	boss = {
		name = "Twisterror",
		position = Position(34119, 32430, 14),
	},
	requiredLevel = 5000,
	timeToFightAgain = ParseDuration("20h") / ParseDuration("1s"),
	playerPositions = {
		{ pos = Position(34117, 32396, 14), teleport = Position(34120, 32436, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34117, 32397, 14), teleport = Position(34120, 32436, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34117, 32398, 14), teleport = Position(34120, 32436, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34117, 32399, 14), teleport = Position(34120, 32436, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34117, 32400, 14), teleport = Position(34120, 32436, 14), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(34104, 32423, 14),
		to = Position(34130, 32443, 14),
	},
	exit = Position(34128, 32431, 14),
}

local lever = BossLever(config)
lever:position(Position(34117, 32395, 14))
lever:register()
