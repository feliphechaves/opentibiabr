local zone = Zone("thais.orcs")
zone:addArea(Position(32261, 32161, 7), Position(32452, 32297, 7))

local raid = Raid("thais.orcs", {
	zone = zone,
	allowedDays = { "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday" },
	minActivePlayers = 1,
	initialChance = 0.03,
	targetChancePerDay = 0.2,
	maxChancePerCheck = 0.15,
	minGapBetween = "24h"
})

-- Stage 1 - aviso inicial
raid:addBroadcast("[RAID] Orcs avistados perto de Thais!"):autoAdvance("60s")

-- Stage 2 - ataque declarado
raid:addBroadcast("[RAID] Thais esta sendo invadida por orcs! Defenda a cidade!"):autoAdvance("10s")

-- Stage 3 - onda principal de inimigos
raid:addSpawnMonsters({
	{ name = "Orc", amount = 9 },
	{ name = "Orc Shaman", amount = 6 },
	{ name = "Orc Rider", amount = 11 },
	{ name = "Orc Berserker", amount = 8 },
	{ name = "Orc Warlord", amount = 3 },
}):autoAdvance("5m")

-- Stage 4 - reforcos inimigos
raid:addSpawnMonsters({
	{ name = "Orc", amount = 9 },
	{ name = "Orc Rider", amount = 6 },
	{ name = "Orc Shaman", amount = 6 },
	{ name = "Orc Warlord", amount = 2 },
}):autoAdvance("5m")

-- Stage 5 - boss final: Orc Armor
raid:addBroadcast("[RAID] Os lideres apareceram! Eles carregam items valiosos!"):autoAdvance("10s")

raid:addSpawnMonsters({
	{ name = "Orc Armor", amount = 1 },
	{ name = "Orc Helmet", amount = 1 },
	{ name = "Orc Shield", amount = 1 },
}):autoAdvance("30m")

raid:register()