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

raid
	:addSpawnMonsters({
		{
			name = "Rat",
			amount = 50,
		},
		{
			name = "Cave Rat",
			amount = 30,
		},
	})
	:autoAdvance("2m")

raid
	:addSpawnMonsters({
		{
			name = "Rat",
			amount = 20,
		},
		{
			name = "Cave Rat",
			amount = 20,
		},
	})
	:autoAdvance("2m")

raid:addBroadcast("[RAID] O rato chefe Munster esta chegando, cuidado!"):autoAdvance("5s")

raid
	:addSpawnMonsters({
		{
			name = "Munster",
			amount = 1,
		},
	})
	:autoAdvance("30m")

raid:register()
