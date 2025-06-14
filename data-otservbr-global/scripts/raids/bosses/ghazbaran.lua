local zone = Zone("hrodmir.ghazbaran")
zone:addArea(Position(32194, 30986, 14), Position(32213, 31012, 14)) -- area dos minions
zone:addArea(Position(32228, 31163, 15), Position(32228, 31163, 15)) -- sqm do boss

local raid = Raid("hrodmir.ghazbaran", {
	zone = zone,
	allowedDays = { "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday" },
	minActivePlayers = 20,
	initialChance = 0.01,
	targetChancePerDay = 0.05,
	maxChancePerCheck = 0.1,
	minGapBetween = "96h", -- muito raro, muito forte
})

-- Anuncios de terror
raid:addBroadcast("[RAID] Um mal antigo esta despertando nas minas de Hrodmir..."):autoAdvance("30s")
raid:addBroadcast("[RAID] Entidades demonicas estao invadindo o reino mortal pelas minas de Hrodmir!"):autoAdvance("30s")
raid:addBroadcast("[RAID] Ghazbaran revelou sua presenca nas profundezas de Hrodmir!"):autoAdvance("5s")

-- Spawn dos minions (tudo no mesmo stage para evitar muitos avanços curtos)
raid
	:addSpawnMonsters({
		{ name = "Deathslicer", amount = 12 },
		{ name = "Juggernaut", amount = 5 },
		{ name = "Fury", amount = 8 },
		{ name = "Demon", amount = 6 },
	})
	:autoAdvance("20s")

-- Boss final
raid
	:addSpawnMonsters({
		{ name = "Ghazbaran", amount = 1, position = Position(32228, 31163, 15) },
	})
	:autoAdvance("30m")

raid:register()
