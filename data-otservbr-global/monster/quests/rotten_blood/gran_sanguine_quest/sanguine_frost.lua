local mType = Game.createMonsterType("Sanguine Frost")
local monster = {}

monster.description = "a sanguine frost"
monster.experience = 95000
monster.outfit = {
	lookType = 2516,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 2582
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

monster.health = 110000
monster.maxHealth = 110000
monster.race = "undead"
monster.corpse = 8137
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

monster.events = {
	--"SanguineFrostDeath",
}

monster.voices = {}

monster.loot = {
	{ name = "crystal coin", chance = 12961, maxCount = 2 },
	{ name = "small emerald", chance = 9133, maxCount = 5 },
	{ name = "small sapphire", chance = 9133, maxCount = 5 },
	{ name = "blue gem", chance = 7000, maxCount = 2 },
	{ name = "violet gem", chance = 7000, maxCount = 2 },
	{ name = "yellow gem", chance = 7000, maxCount = 2 },
	{ name = "green gem", chance = 7000, maxCount = 2 },
	{ name = "glacier mask", chance = 7000 },
	{ name = "glacier amulet", chance = 5000 },
	{ name = "glacier robe", chance = 3000 },
	{ name = "platinum amulet", chance = 2000 },
	{ name = "wand of defiance", chance = 2000 },
	{ id = 23542, chance = 2000 }, -- collar of blue plasma
	{ id = 23529, chance = 2000 }, -- ring of blue plasma
	{ name = "alloy legs", chance = 2000 },
	{ name = "magic plate armor", chance = 2000 },
	{ name = "tainted heart", chance = 2, maxCount = 2 },
	{ name = "darklight heart", chance = 2, maxCount = 2 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 10, minDamage = -0, maxDamage = -3500 },
	{ name = "combat", interval = 2000, chance = 35, type = COMBAT_ICEDAMAGE, minDamage = -2500, maxDamage = -3600, length = 10, spread = 3, effect = CONST_ME_ICEAREA, target = false },
	{ name = "combat", interval = 2000, chance = 40, type = COMBAT_ICEDAMAGE, minDamage = -3000, maxDamage = -4000, range = 7, radius = 4, effect = CONST_ME_ICETORNADO, target = true },
	{ name = "largeicering", interval = 2000, chance = 15, minDamage = -1500, maxDamage = -4500, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -1000, maxDamage = -3000, range = 7, target = false },
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
	{ type = COMBAT_FIREDAMAGE, percent = -20 },
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
