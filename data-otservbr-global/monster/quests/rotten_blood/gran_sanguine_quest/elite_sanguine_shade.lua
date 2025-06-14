local mType = Game.createMonsterType("Elite Sanguine Shade")
local monster = {}

monster.description = "an elite sanguine shade"
monster.experience = 252000 -- 360000 * 0.7
monster.outfit = {
	lookType = 2517,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 2663
monster.Bestiary = {
	class = "Elemental",
	race = BESTY_RACE_ELEMENTAL,
	toKill = 5000,
	FirstUnlock = 200,
	SecondUnlock = 2000,
	CharmsPoints = 100,
	Stars = 5,
	Occurrence = 0,
}

monster.health = 308000 -- 440000 * 0.7
monster.maxHealth = 308000 -- 440000 * 0.7
monster.race = "undead"
monster.corpse = 8181
monster.speed = 195
monster.manaCost = 305

monster.changeTarget = {
	interval = 5000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {}

monster.loot = {
	{ name = "crystal coin", chance = 12961, maxCount = 8 },
	{ name = "small emerald", chance = 9133, maxCount = 20 },
	{ name = "small sapphire", chance = 9133, maxCount = 20 },
	{ name = "small topaz", chance = 9133, maxCount = 20 },
	{ name = "blue gem", chance = 7000, maxCount = 8 },
	{ name = "violet gem", chance = 7000, maxCount = 8 },
	{ name = "yellow gem", chance = 7000, maxCount = 8 },
	{ name = "green gem", chance = 7000, maxCount = 8 },
	{ name = "darklight core", chance = 13367, maxCount = 8 },
	{ name = "basalt crumbs", chance = 5794, maxCount = 8 },
	{ name = "amber staff", chance = 6240, maxCount = 2 },
	{ id = 23544, chance = 1300, maxCount = 2 }, -- collar of red plasma
	{ id = 23533, chance = 1110, maxCount = 2 }, -- Ring of Red Plasma
	{ name = "magic plate armor", chance = 2000, maxCount = 2 },
	{ name = "tainted heart", chance = 2, maxCount = 5 },
	{ name = "darklight heart", chance = 2, maxCount = 5 },
	{ id = 34109, chance = 1 },
	{ id = 39546, chance = 1 },
	{ id = 43895, chance = 1 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -9800 }, -- 14000 * 0.7
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -7000, maxDamage = -10080, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = false }, -- 10000 * 0.7, 14400 * 0.7
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_DEATHDAMAGE, minDamage = -4200, maxDamage = -12600, length = 8, spread = 0, effect = CONST_ME_MORTAREA, target = false }, -- 6000 * 0.7, 18000 * 0.7
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -8400, maxDamage = -11200, length = 7, spread = 0, effect = CONST_ME_EXPLOSIONAREA, target = false }, -- 12000 * 0.7, 16000 * 0.7
	{ name = "combat", interval = 2000, chance = 35, type = COMBAT_DEATHDAMAGE, minDamage = -2800, maxDamage = -8400, radius = 4, effect = CONST_ME_MORTAREA, target = false }, -- 4000 * 0.7, 12000 * 0.7
}

monster.defenses = {
	defense = 104,
	armor = 104,
	mitigation = 3.16,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = -20 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
