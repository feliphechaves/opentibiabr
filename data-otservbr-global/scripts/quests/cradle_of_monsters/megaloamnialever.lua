local config = {
	boss = {
		name = "Goshnars Megalomania",
		position = Position(33710, 31634, 14),
	},
	timeToFightAgain = 20 * 60 * 60,
	playerPositions = {
		{ pos = Position(33676, 31634, 14), teleport = Position(33710, 31639, 14) },
		{ pos = Position(33677, 31634, 14), teleport = Position(33710, 31639, 14) },
		{ pos = Position(33678, 31634, 14), teleport = Position(33710, 31639, 14) },
		{ pos = Position(33679, 31634, 14), teleport = Position(33710, 31639, 14) },
		{ pos = Position(33680, 31634, 14), teleport = Position(33710, 31639, 14) },
	},
	monsters = {},
	specPos = {
		from = Position(33701, 31626, 14),
		to = Position(33719, 31642, 14),
	},
	exit = Position(33621, 31427, 10),
}

local lever = BossLever(config)
lever:position(Position(33675, 31634, 14))
lever:register()