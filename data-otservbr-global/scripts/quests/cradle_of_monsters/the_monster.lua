local config = {
	boss = {
		name = "The Monster",
		position = Position(33837, 32591, 12),
	},
	timeToFightAgain = 12 * 60 * 60,
	playerPositions = {
		{ pos = Position(33812, 32584, 12), teleport = Position(33831, 32591, 12) },
		{ pos = Position(33811, 32584, 12), teleport = Position(33831, 32591, 12) },
		{ pos = Position(33810, 32584, 12), teleport = Position(33831, 32591, 12) },
		{ pos = Position(33809, 32584, 12), teleport = Position(33831, 32591, 12) },
		{ pos = Position(33808, 32584, 12), teleport = Position(33831, 32591, 12) },
	},
	monsters = {},
	specPos = {
		from = Position(33828, 32584, 12),
		to = Position(33846, 32598, 12),
	},
	exit = Position(33829, 32591, 12),
}

local lever = BossLever(config)
lever:position(Position(33813, 32584, 12))
lever:register()

SimpleTeleport({ x = 33792, y = 32581, z = 12 }, { x = 33806, y = 32584, z = 12 })
-- Exit from lever room
SimpleTeleport({ x = 33804, y = 32584, z = 12 }, { x = 33792, y = 32579, z = 12 })