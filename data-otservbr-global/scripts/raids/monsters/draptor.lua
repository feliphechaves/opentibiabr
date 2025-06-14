local zone = Zone("farmine.draptor")
zone:addArea(Position(33195, 31160, 7), Position(33286, 31247, 7))

local raid = Raid("farmine.draptor", {
	zone = zone,
	allowedDays = { "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday" },
	minActivePlayers = 1,
	initialChance = 0.03,
	targetChancePerDay = 0.2,
	maxChancePerCheck = 0.15,
	minGapBetween = "24h",
})

raid:addBroadcast("[RAID] Draptos apareceram em Zao!"):autoAdvance("10s")

raid
	:addSpawnMonsters({
		{
			name = "Draptor",
			amount = 8,
		},
	})
	:autoAdvance("2m")

raid:addBroadcast("[RAID] Grand Mother Foulscale vai nascer!"):autoAdvance("10s")

raid
	:addSpawnMonsters({
		{
			name = "Grand Mother Foulscale",
			amount = 1,
		},
	})
	:autoAdvance("30m")

raid:register()
