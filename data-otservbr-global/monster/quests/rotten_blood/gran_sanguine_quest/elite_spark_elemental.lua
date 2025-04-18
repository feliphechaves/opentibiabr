local mType = Game.createMonsterType("Elite Spark Elemental")
local monster = {}

monster.description = "an Elite Spark Elemental"
monster.experience = 2200
monster.outfit = {
	lookType = 293,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 457
monster.Bestiary = {
	class = "Elemental",
	race = BESTY_RACE_ELEMENTAL,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Khazeel, Energy Elemental Lair, Vandura Mountain, Vengoths mountain.",
}

monster.health = 200000
monster.maxHealth = 200000
monster.race = "venom"
monster.corpse = 8138
monster.speed = 115
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
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
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 85,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = false,
}

monster.light = {
	level = 4,
	color = 143,
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ id = 3007, chance = 2000, maxCount = 2 }, -- crystal ring
	{ name = "gold coin", chance = 50000, maxCount = 400 },
	{ name = "gold coin", chance = 50000, maxCount = 280 },
	{ name = "small amethyst", chance = 5000, maxCount = 8 },
	{ id = 3051, chance = 892, maxCount = 2 }, -- energy ring
	{ name = "silver amulet", chance = 1020, maxCount = 2 },
	{ name = "wand of cosmic energy", chance = 636, maxCount = 2 },
	{ name = "throwing star", chance = 9900, maxCount = 20 },
	{ name = "obsidian lance", chance = 3571, maxCount = 2 },
	{ name = "guardian shield", chance = 243, maxCount = 2 },
	{ name = "crystal sword", chance = 5882, maxCount = 2 },
	{ name = "strong mana potion", chance = 7692, maxCount = 4 },
	{ name = "mana potion", chance = 11711, maxCount = 8 },
	{ id = 761, chance = 10000, maxCount = 40 }, -- flash arrow
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -700 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_ENERGYDAMAGE, minDamage = -500, maxDamage = -1008, range = 7, radius = 2, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -400, maxDamage = -520, range = 7, shootEffect = CONST_ANI_ENERGYBALL, effect = CONST_ME_ENERGYHIT, target = true },
	{ name = "energy elemental electrify", interval = 2000, chance = 20, target = false },
}

monster.defenses = {
	defense = 15,
	armor = 25,
	mitigation = 0.72,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 360, maxDamage = 600, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 100 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster) 