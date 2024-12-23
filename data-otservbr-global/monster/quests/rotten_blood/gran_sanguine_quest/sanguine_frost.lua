local mType = Game.createMonsterType("Sanguine Frost")
local monster = {}

monster.description = "a sanguine frost"
monster.experience = 90000
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
	"SanguineFrostDeath",
}

monster.voices = {}

monster.loot = {
	{ name = "crystal coin", chance = 12961, maxCount = 1 },
	{ name = "small emerald", chance = 9133, maxCount = 5 },
	{ name = "blue gem", chance = 7808, maxCount = 1 },
	{ name = "violet gem", chance = 7084, maxCount = 1 },
	{ name = "platinum amulet", chance = 1750 },
	{ name = "glacier robe", chance = 880 },
	{ name = "glacier amulet", chance = 3510 },
	{ name = "green gem", chance = 4940 },
	{ name = "alloy legs", chance = 440 },
	{ name = "wand of defiance", chance = 1750 },
	{ name = "glacier mask", chance = 4670 },
	--{ id = 43895, chance = 1} --bag you covet
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
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = -55 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
