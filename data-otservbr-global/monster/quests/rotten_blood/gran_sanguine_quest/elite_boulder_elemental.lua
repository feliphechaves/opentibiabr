local mType = Game.createMonsterType("Elite Boulder Elemental")
local monster = {}

monster.description = "an elite Boulder Elemental"
monster.experience = 2200
monster.outfit = {
	lookType = 301,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 458
monster.Bestiary = {
	class = "Elemental",
	race = BESTY_RACE_ELEMENTAL,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Edron Earth Elemental Cave, Vandura Mountain, Deeper Banuta, Vengoth Castle, Robson Isle, \z
	Drillworm Caves, Crystal Grounds, Middle Spike.",
}

monster.health = 200000
monster.maxHealth = 200000
monster.race = "undead"
monster.corpse = 8105
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
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 80,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = false,
	canWalkOnPoison = true,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Stomp.", yell = false },
}

monster.loot = {
	{ name = "small stone", chance = 10000, maxCount = 40 },
	{ name = "gold coin", chance = 43000, maxCount = 400 },
	{ name = "gold coin", chance = 50000, maxCount = 120 },
	{ name = "blank rune", chance = 10000, maxCount = 4 },
	{ name = "strong mana potion", chance = 1910, maxCount = 4 },
	{ name = "earth arrow", chance = 20160, maxCount = 120 },
	{ id = 8894, chance = 350, maxCount = 2 }, -- heavily rusted armor
	{ name = "small topaz", chance = 620, maxCount = 4 },
	{ name = "lump of earth", chance = 20460, maxCount = 4 },
	{ name = "clay lump", chance = 570, maxCount = 4 },
	{ id = 12600, chance = 470, maxCount = 4 }, -- coal
	{ id = 34109, chance = 1},
	{ id = 39546, chance = 1},
	{ id = 43895, chance = 1},
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -440 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -288, maxDamage = -420, range = 7, shootEffect = CONST_ANI_SMALLEARTH, effect = CONST_ME_GREEN_RINGS, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -400, range = 7, radius = 2, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_POFF, target = true },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 20, minDamage = -800, maxDamage = -1040, length = 6, spread = 0, effect = CONST_ME_BIGPLANTS, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 10, minDamage = -400, maxDamage = -560, radius = 5, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = false },
	{ name = "speed", interval = 2000, chance = 10, speedChange = -330, range = 5, effect = CONST_ME_SMALLPLANTS, target = true, duration = 5000 },
}

monster.defenses = {
	defense = 100,
	armor = 180,
	mitigation = 3.12,
	{ name = "combat", interval = 2000, chance = 5, type = COMBAT_HEALING, minDamage = 240, maxDamage = 320, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
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