local zone = Zone("thais.wild-horses")
zone:addArea(Position(32456, 32193, 7), Position(32491, 32261, 7))
zone:addArea(Position(32431, 32240, 7), Position(32464, 32280, 7))

local raid = Raid("thais.wild-horses", {
	zone = zone,
	allowedDays = { "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday" },
	minActivePlayers = 1,
	initialChance = 0.04,
	targetChancePerDay = 0.25,
	maxChancePerCheck = 0.2,
	maxChecksPerDay = 0.25,
	minGapBetween = "24h",
})

raid:addBroadcast("[RAID] Wild Horses apareceram em Thais!"):autoAdvance("10s")

raid
	:addSpawnMonsters({
		{
			name = "Wild Horse",
			amount = 10,
		},
	})
	:autoAdvance("10s")

raid:register()
