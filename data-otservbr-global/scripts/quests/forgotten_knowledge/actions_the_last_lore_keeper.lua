local config = {
	boss = {
		name = "The Last Lore Keeper",
		position = Position(31986, 32842, 14),
	},
	timeToFightAgain = 20 * 60 * 60,
	playerPositions = {
		{ pos = Position(32018, 32844, 14), teleport = Position(31985, 32851, 14) },
		{ pos = Position(32018, 32845, 14), teleport = Position(31985, 32851, 14) },
		{ pos = Position(32018, 32846, 14), teleport = Position(31985, 32851, 14) },
		{ pos = Position(32018, 32847, 14), teleport = Position(31985, 32851, 14) },
		{ pos = Position(32018, 32848, 14), teleport = Position(31985, 32851, 14) },

		{ pos = Position(32019, 32844, 14), teleport = Position(31985, 32851, 14) },
		{ pos = Position(32019, 32845, 14), teleport = Position(31985, 32851, 14) },
		{ pos = Position(32019, 32846, 14), teleport = Position(31985, 32851, 14) },
		{ pos = Position(32019, 32847, 14), teleport = Position(31985, 32851, 14) },
		{ pos = Position(32019, 32848, 14), teleport = Position(31985, 32851, 14) },

		{ pos = Position(32020, 32844, 14), teleport = Position(31985, 32851, 14) },
		{ pos = Position(32020, 32845, 14), teleport = Position(31985, 32851, 14) },
		{ pos = Position(32020, 32846, 14), teleport = Position(31985, 32851, 14) },
		{ pos = Position(32020, 32847, 14), teleport = Position(31985, 32851, 14) },
		{ pos = Position(32020, 32848, 14), teleport = Position(31985, 32851, 14) },
	},
	monsters = {
		{ name = "a shielded astral glyph", pos = Position(31986, 32840, 14) },
		{ name = "bound astral power", pos = Position(31975, 32856, 15) },
		{ name = "the astral source", pos = Position(31987, 32839, 14) },
		{ name = "the distorted astral source", pos = Position(31986, 32823, 15) },
		{ name = "an astral glyph", pos = Position(31989, 32823, 15) },
	},
	specPos = {
		from = Position(31971, 32834, 14),
		to = Position(32000, 32861, 14),
	},
	exit = Position(32980, 31672, 14),
}

leverLoreKeeper = BossLever(config)
leverLoreKeeper:position(Position(32019, 32843, 14))
leverLoreKeeper:register()
