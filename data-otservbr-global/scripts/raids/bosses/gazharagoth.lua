local zone = Zone("gazharagoth")
zone:addArea(Position(33538, 32381, 12), Position(33538, 32381, 12)) -- local exato do spawn

local raid = Raid("gazharagoth", {
	zone = zone,
	allowedDays = { "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday" },
	minActivePlayers = 20,
	initialChance = 0.005,
	targetChancePerDay = 0.03,
	maxChancePerCheck = 0.05,
	minGapBetween = "96h" -- só uma vez a cada 4 dias no maximo
})

raid:addBroadcast("[RAID] Algo estranho esta acontecendo... Melhor se esconder!"):autoAdvance("20s")
raid:addBroadcast("[RAID] Sua forca e ilimitada... ate mesmo os demonios se ajoelham diante dele!"):autoAdvance("30s")
raid:addBroadcast("[RAID] O temido Gaz'Haragoth esta invadindo o mundo a partir de sua prisao!"):autoAdvance("30s")
raid:addBroadcast("[RAID] Saiam enquanto ha tempo, mortais. Gaz'Haragoth esta aqui!"):autoAdvance("10s")

raid:addSpawnMonsters({
	{ name = "Gaz'Haragoth", amount = 1, position = Position(33538, 32381, 12) },
}):autoAdvance("30m")

raid:register()