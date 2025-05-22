local zone = Zone("folda.yeti")
zone:addArea(Position(31991, 31580, 7), Position(32044, 31616, 7))

local raid = Raid("folda.yeti", {
	zone = zone,
	allowedDays = { "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday" },
	minActivePlayers = 1,
	initialChance = 0.02,
	targetChancePerDay = 0.25,
	maxChancePerCheck = 0.2,
	minGapBetween = "48h",
})

raid:addBroadcast("[RAID] Yetis irao aparecer em Folda, cuidado!!"):autoAdvance("30s")

for i = 1, 20 do
	raid
		:addSpawnMonsters({
			{
				name = "Yeti",
				amount = 3,
			},
		})
		:autoAdvance("30m")
end

raid:register()
