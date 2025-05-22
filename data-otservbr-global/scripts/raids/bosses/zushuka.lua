local zone = Zone("nibelor.zushuka")
zone:addArea(Position(31941, 31388, 9), Position(31941, 31388, 9)) -- sqm exato onde ela aparece

local raid = Raid("nibelor.zushuka", {
	zone = zone,
	allowedDays = { "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday" },
	minActivePlayers = 10,
	initialChance = 0.025,
	targetChancePerDay = 0.12,
	maxChancePerCheck = 0.15,
	minGapBetween = "48h"
})

-- Opcional: um aviso curto, mesmo que o XML não tenha
raid:addBroadcast("[RAID] Zushuka foi avistada em Nibelor!"):autoAdvance("10s")

-- Spawn da boss
raid:addSpawnMonsters({
	{ name = "Zushuka", amount = 1, position = Position(31941, 31388, 9) }
}):autoAdvance("30m")

raid:register()
