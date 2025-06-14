local zone = Zone("nibelor.ocyakao")
zone:addArea(Position(32353, 31052, 7), Position(32353, 31052, 7)) -- sqm onde ele nasce

local raid = Raid("nibelor.ocyakao", {
	zone = zone,
	allowedDays = { "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday" },
	minActivePlayers = 10,
	initialChance = 0.03,
	targetChancePerDay = 0.15,
	maxChancePerCheck = 0.15,
	minGapBetween = "48h",
})

-- Aviso
raid:addBroadcast("[RAID] Cuidado! Ocyakao despertou em Nibelor!"):autoAdvance("10s")

-- Spawn direto
raid
	:addSpawnMonsters({
		{ name = "Ocyakao", amount = 1, position = Position(32353, 31052, 7) },
	})
	:autoAdvance("30m")

raid:register()
