local zone = Zone("thais.rats")
zone:addArea(Position(32331, 32182, 7), Position(32426, 32261, 7))

local raid = Raid("thais.rats", {
	zone = zone,
	allowedDays = { "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday" },
	minActivePlayers = 1,
	initialChance = 0.04,
	targetChancePerDay = 0.25,
	maxChancePerCheck = 0.2,
	minGapBetween = "24h",
})

raid:addBroadcast("[RAID] Uma praga de ratos esta acontecendo em Thais!"):autoAdvance("5s")

-- Grupo 1
raid
	:addSpawnMonsters({
		{ name = "Rat", amount = 10, position = Position(32391, 32214, 7) },
		{ name = "Cave Rat", amount = 5, position = Position(32396, 32214, 7) },
	})
	:autoAdvance("30s")

-- Grupo 2
raid
	:addSpawnMonsters({
		{ name = "Rat", amount = 10, position = Position(32335, 32215, 7) },
		{ name = "Cave Rat", amount = 5, position = Position(32339, 32215, 7) },
	})
	:autoAdvance("30s")

-- Grupo 3
raid
	:addSpawnMonsters({
		{ name = "Rat", amount = 10, position = Position(32368, 32198, 7) },
		{ name = "Cave Rat", amount = 10, position = Position(32368, 32202, 7) },
	})
	:autoAdvance("30s")

-- Grupo 4
raid
	:addSpawnMonsters({
		{ name = "Rat", amount = 10, position = Position(32369, 32224, 7) },
		{ name = "Cave Rat", amount = 10, position = Position(32369, 32227, 7) },
	})
	:autoAdvance("30s")

-- Boss: Munster
raid
	:addSpawnMonsters({
		{ name = "Munster", amount = 1, position = Position(32373, 32215, 7) },
	})
	:autoAdvance("30s")

raid:addBroadcast("[RAID] O rato chefe Munster apareceu dos esgotos de Thais!"):autoAdvance("30m")

raid:register()
