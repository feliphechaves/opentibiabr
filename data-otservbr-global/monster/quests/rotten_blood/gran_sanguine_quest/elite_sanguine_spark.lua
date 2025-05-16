local mType = Game.createMonsterType("Elite Sanguine Spark")
local monster = {}

monster.description = "an elite sanguine spark"
monster.experience = 252000 -- 360000 * 0.7
monster.outfit = {
	lookType = 2513,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 2612
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
monster.corpse = 8136
monster.speed = 195
monster.manaCost = 305

monster.changeTarget = {
	interval = 5000,
	chance = 10,
}

monster.events = {
	"SanguineSparkDeath",
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
	canWalkOnEnergy = true,
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
	{ name = "small sapphire", chance = 9133, maxCount = 20 },
	{ name = "blue gem", chance = 7000, maxCount = 8 },
	{ name = "violet gem", chance = 7000, maxCount = 8 },
	{ name = "yellow gem", chance = 7000, maxCount = 8 },
	{ name = "green gem", chance = 7000, maxCount = 8 },
	{ name = "darklight core", chance = 10276, maxCount = 8 },
	{ name = "darklight basalt chunk", chance = 12855, maxCount = 8 },
	{ name = "wand of starstorm", chance = 7967, maxCount = 2 },
	{ name = "platinum amulet", chance = 7967, maxCount = 2 },
	{ name = "guardian boots", chance = 1010, maxCount = 2 },
	{ id = 23542, chance = 1250, maxCount = 2 }, -- collar of blue plasma
	{ id = 23529, chance = 1230, maxCount = 2 }, -- ring of blue plasma
	{ name = "tainted heart", chance = 2, maxCount = 5 },
	{ name = "darklight heart", chance = 2, maxCount = 5 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 20, minDamage = -0, maxDamage = -9800 }, -- 14000 * 0.7
	{ name = "combat", interval = 2500, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -11200, maxDamage = -25200, radius = 5, effect = CONST_ME_PURPLESMOKE, target = true }, -- 16000 * 0.7, 36000 * 0.7
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -11200, maxDamage = -28000, length = 8, spread = 3, effect = CONST_ME_ELECTRICALSPARK, target = false }, -- 16000 * 0.7, 40000 * 0.7
	{ name = "largeenergyring", interval = 2000, chance = 10, minDamage = -11200, maxDamage = -28000, target = false }, -- 16000 * 0.7, 40000 * 0.7
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -2800, maxDamage = -8400, range = 7, target = false }, -- 4000 * 0.7, 12000 * 0.7
}

monster.defenses = {
	defense = 104,
	armor = 104,
	mitigation = 3.16,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = -20 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster) 