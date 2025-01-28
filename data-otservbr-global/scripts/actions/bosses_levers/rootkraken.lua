local config = {
	boss = {
		name = "The Rootkraken",
		position = Position(1399, 1112, 7),
	},
	timeAfterKill = 60,
	playerPositions = {
		{ pos = Position(1387, 1188, 7), teleport = Position(1399, 1119, 7) },
		{ pos = Position(1387, 1189, 7), teleport = Position(1399, 1119, 7) },
		{ pos = Position(1387, 1190, 7), teleport = Position(1399, 1119, 7) },
		{ pos = Position(1387, 1191, 7), teleport = Position(1399, 1119, 7) },
		{ pos = Position(1387, 1192, 7), teleport = Position(1399, 1119, 7) },
	},
	specPos = {
		from = Position(1375, 1091, 7),
		to = Position(1424, 1136, 7),
	},
	exit = Position(1384, 1189, 7),
	exitTeleporter = Position(1399, 1122, 7),
}

local lever = BossLever(config)
lever:position(Position(1387, 1187, 7))
lever:register()
