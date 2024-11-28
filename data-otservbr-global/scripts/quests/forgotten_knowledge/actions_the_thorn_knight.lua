local config = {
	boss = {
		name = "The Enraged Thorn Knight",
		position = Position(32624, 32880, 14),
	},
	timeToFightAgain = 20 * 60 * 60,
	playerPositions = {
		{ pos = Position(32657, 32877, 14), teleport = Position(32624, 32886, 14) },
		{ pos = Position(32759, 32878, 14), teleport = Position(32624, 32886, 14) },
		{ pos = Position(32759, 32879, 14), teleport = Position(32624, 32886, 14) },
		{ pos = Position(32759, 32880, 14), teleport = Position(32624, 32886, 14) },
		{ pos = Position(32759, 32881, 14), teleport = Position(32624, 32886, 14) },
	},
	monsters = {
		{ name = "possessed tree", pos = Position(math.random(32619, 32629), math.random(32877, 32884), 14) },
		{ name = "possessed tree", pos = Position(math.random(32619, 32629), math.random(32877, 32884), 14) },
		{ name = "possessed tree", pos = Position(math.random(32619, 32629), math.random(32877, 32884), 14) },
		{ name = "possessed tree", pos = Position(math.random(32619, 32629), math.random(32877, 32884), 14) },
		{ name = "possessed tree", pos = Position(math.random(32619, 32629), math.random(32877, 32884), 14) },
		{ name = "possessed tree", pos = Position(math.random(32619, 32629), math.random(32877, 32884), 14) },
	},
	specPos = {
		from = Position(32612, 32868, 14),
		to = Position(32636, 32890, 14),
	},
	exit = Position(32627, 32889, 14),
}

local leverThornKnight = BossLever(config)
leverThornKnight:position(Position(32657, 32876, 14))
leverThornKnight:register()
