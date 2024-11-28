local config = {
	boss = {
		name = "Soul of Dragonking Zyrtarch",
		position = Position(33357, 31182, 10),
	},
	timeToFightAgain = 20 * 60 * 60,
	playerPositions = {
		{ pos = Position(33391, 31178, 10), teleport = Position(33359, 31186, 10) },
		{ pos = Position(33391, 31179, 10), teleport = Position(33359, 31186, 10) },
		{ pos = Position(33391, 31180, 10), teleport = Position(33359, 31186, 10) },
		{ pos = Position(33391, 31181, 10), teleport = Position(33359, 31186, 10) },
		{ pos = Position(33391, 31182, 10), teleport = Position(33359, 31186, 10) },
	},
	monsters = {
		{ name = "soulcatcher", pos = Position(33352, 31187, 10) },
		{ name = "soulcatcher", pos = Position(33363, 31187, 10) },
		{ name = "soulcatcher", pos = Position(33353, 31176, 10) },
		{ name = "soulcatcher", pos = Position(33363, 31176, 10) },
	},
	specPos = {
		from = Position(33347, 31171, 10),
		to = Position(33370, 31192, 10),
	},
	exit = Position(33361, 31191, 10),
}

leverZyrtarch = BossLever(config)
leverZyrtarch:position(Position(33391, 31177, 10))
leverZyrtarch:register()