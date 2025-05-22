local zone = Zone("edron.orshabaal")
zone:addArea(Position(33118, 31699, 7), Position(33118, 31699, 7)) -- apenas o sqm do boss

local raid = Raid("edron.orshabaal", {
	zone = zone,
	allowedDays = { "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday" },
	minActivePlayers = 1,
	initialChance = 0.01,
	targetChancePerDay = 0.05,
	maxChancePerCheck = 0.1,
	minGapBetween = "72h"
})

-- Avisos progressivos
raid:addBroadcast("[RAID] Os lacaios de Orshabaal estao tentando traze-lo de volta ao mundo dos mortais!"):autoAdvance("20s")
raid:addBroadcast("[RAID] Orshabaal esta prestes a retornar! Fujam enquanto ha tempo!"):autoAdvance("40s")
raid:addBroadcast("[RAID] Orshabaal foi invocado e esta em Edron!"):autoAdvance("10s")

-- Spawn do boss
raid:addSpawnMonsters({
	{ name = "Orshabaal", amount = 1, position = Position(33118, 31699, 7) },
}):autoAdvance("30m") -- tempo limite para matar

raid:register()