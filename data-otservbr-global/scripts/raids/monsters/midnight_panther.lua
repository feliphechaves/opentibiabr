local zone = Zone("tiquanda.midnight-panther")
zone:addArea(Position(32847, 32697, 7), Position(32871, 32738, 7))

local raid = Raid("tiquanda.midnight-panther", {
	zone = zone,
	allowedDays = { "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday" },
	minActivePlayers = 1,
	initialChance = 0.02,
	targetChancePerDay = 0.12,
	maxChancePerCheck = 0.08,
	minGapBetween = "48h"
})

local possiblePositions = {
	Position(32847, 32697, 7),
	Position(32871, 32717, 7),
	Position(32856, 32738, 7),
}

raid:addBroadcast("[RAID] Uma Midnight Panther apareceu!!"):autoAdvance("10s")

raid
	:addSpawnMonsters({
		{
			name = "Midnight Panther",
			amount = 1,
			position = possiblePositions[math.random(1, #possiblePositions)],
		},
	})
	:autoAdvance("30m")

raid:register()
