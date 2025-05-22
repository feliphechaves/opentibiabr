local zone = Zone("goroma.morgaroth")
zone:addArea(Position(32063, 32612, 14), Position(32063, 32612, 14)) -- sqm onde ele nasce

local raid = Raid("goroma.morgaroth", {
	zone = zone,
	allowedDays = { "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday" },
	minActivePlayers = 1,
	initialChance = 0.01,
	targetChancePerDay = 0.05,
	maxChancePerCheck = 0.1,
	minGapBetween = "72h" -- só 1x a cada 3 dias
})

raid:addBroadcast("[RAID] O antigo vulcao de Goroma esta se tornando ativo novamente..."):autoAdvance("30s")
raid:addBroadcast("[RAID] Ha uma presenca maligna surgindo no interior do vulcao de Goroma."):autoAdvance("30s")
raid:addBroadcast("[RAID] Cultistas invocaram uma entidade ancestral! Morgaroth despertou!"):autoAdvance("10s")

raid:addSpawnMonsters({
	{ name = "Morgaroth", amount = 1, position = Position(32063, 32612, 14) }
}):autoAdvance("30m")

raid:register()