local zone = Zone("undead.cavebear")
zone:addArea(Position(31909, 32554, 7), Position(31983, 32579, 7))

local raid = Raid("undead.cavebear", {
	zone = zone,
	allowedDays = { "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday" },
	minActivePlayers = 2,
	initialChance = 0.02,
	targetChancePerDay = 0.15,
	maxChancePerCheck = 0.1,
	minGapBetween = "36h",
})

for i = 1, 3 do
	raid
		:addSpawnMonsters({
			{
				name = "Undead Cavebear",
				amount = 3,
			},
		})
		:autoAdvance("30m")
end

raid:register()
