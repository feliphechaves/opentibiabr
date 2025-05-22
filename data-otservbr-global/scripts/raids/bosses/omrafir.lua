local zone = Zone("roshamuul.omrafir")
zone:addArea(Position(33587, 32378, 12), Position(33587, 32378, 12)) -- sqm exato da prisao

local raid = Raid("roshamuul.omrafir", {
	zone = zone,
	allowedDays = { "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday" },
	minActivePlayers = 15,
	initialChance = 0.01,
	targetChancePerDay = 0.05,
	maxChancePerCheck = 0.1,
	minGapBetween = "72h" -- ocorre no maximo a cada 3 dias
})

raid:addBroadcast("[RAID] Omrafir esta prestes a entrar na prisao de Roshamuul! Fujam enquanto ha tempo!"):autoAdvance("40s")
raid:addBroadcast("[RAID] Omrafir apareceu... Cuidado, mortais!"):autoAdvance("20s")

raid:addSpawnMonsters({
	{ name = "Omrafir", amount = 1, position = Position(33587, 32378, 12) }
}):autoAdvance("30m")

raid:register()
