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
-- raid:addSpawnMonsters({
-- 	{ name = "Orc", amount = 9 },
-- 	{ name = "Orc Shaman", amount = 6 },
-- 	{ name = "Orc Rider", amount = 11 },
-- 	{ name = "Orc Berserker", amount = 8 },
-- 	{ name = "Orc Warlord", amount = 3 },
-- }):autoAdvance("1m")
-- Stage 3 - onda principal de inimigos (agora com spawn distribuido)

-- Grupo 1 - entrada norte de Thais
raid:addSpawnMonsters({
	{ name = "Orc", amount = 4, position = Position(32342, 32281, 7) },
	{ name = "Orc Shaman", amount = 2, position = Position(32342, 32282, 7) },
}):autoAdvance("10s")

-- Grupo 2 - por trás do templo
raid:addSpawnMonsters({
	{ name = "Orc Rider", amount = 5, position = Position(32324, 32254, 7) },
	{ name = "Orc", amount = 2, position = Position(32324, 32256, 7) },
}):autoAdvance("10s")

-- Grupo 3 - frente da DP
raid:addSpawnMonsters({
	{ name = "Orc Berserker", amount = 4, position = Position(32369, 32225, 7) },
	{ name = "Orc Warlord", amount = 1, position = Position(32369, 32226, 7) },
}):autoAdvance("10s")

-- Grupo 4 - praça central
raid:addSpawnMonsters({
	{ name = "Orc", amount = 3, position = Position(32336, 32215, 7) },
	{ name = "Orc Shaman", amount = 2, position = Position(32335, 32215, 7) },
	{ name = "Orc Rider", amount = 2, position = Position(32334, 32215, 7) },
}):autoAdvance("10s")

-- Grupo 5 - saida sul
raid:addSpawnMonsters({
	{ name = "Orc Berserker", amount = 4, position = Position(32349, 32190, 7) },
	{ name = "Orc Warlord", amount = 2, position = Position(32349, 32191, 7) },
}):autoAdvance("10s")


-- Stage 4 - reforcos inimigos
-- raid:addSpawnMonsters({
-- 	{ name = "Orc", amount = 9 },
-- 	{ name = "Orc Rider", amount = 6 },
-- 	{ name = "Orc Shaman", amount = 6 },
-- 	{ name = "Orc Warlord", amount = 2 },
-- }):autoAdvance("1m")

-- Stage 4 - reforcos inimigos (mais distribuido)

raid:addSpawnMonsters({
	{ name = "Orc", amount = 4, position = Position(32337, 32233, 7) },
	{ name = "Orc Rider", amount = 3, position = Position(32337, 32234, 7) },
}):autoAdvance("10s")

raid:addSpawnMonsters({
	{ name = "Orc Shaman", amount = 3, position = Position(32338, 32215, 7) },
	{ name = "Orc Rider", amount = 3, position = Position(32339, 32215, 7) },
}):autoAdvance("10s")

raid:addSpawnMonsters({
	{ name = "Orc", amount = 5, position = Position(32332, 32190, 7) },
	{ name = "Orc Warlord", amount = 2, position = Position(32333, 32190, 7) },
}):autoAdvance("10s")

-- Stage 5 - boss final: Orc Armor
-- Stage 5 - boss final aleatório: Orc Armor OU Helmet OU Shield

raid:addStage({
	start = function()
		local bosses = {
			{ name = "Orc Armor", message = "[RAID] Orc Armor apareceu em Thais carregando uma armadura rara!" },
			{ name = "Orc Helmet", message = "[RAID] Orc Helmet surgiu em Thais trazendo um capacete misterioso!" },
			{ name = "Orc Shield", message = "[RAID] Orc Shield foi visto em Thais com um escudo valioso!" }
		}

		local boss = bosses[math.random(#bosses)]

		Game.createMonster(boss.name, Position(32369, 32215, 7), true, true)
		Game.broadcastMessage(boss.message, MESSAGE_EVENT_ADVANCE)

	end
}):autoAdvance("30m")

raid:register()