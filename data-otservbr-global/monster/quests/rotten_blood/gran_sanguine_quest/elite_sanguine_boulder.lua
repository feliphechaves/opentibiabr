local mType = Game.createMonsterType("Elite Sanguine Boulder")
local monster = {}

monster.description = "an elite sanguine boulder"
monster.experience = 252000
monster.outfit = {
	lookType = 2515,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.events = {
	"SanguineBoulderDeath",
}

monster.raceId = 2665
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

monster.health = 308000
monster.maxHealth = 308000
monster.race = "undead"
monster.corpse = 8105
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
	canWalkOnPoison = true,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {}

monster.loot = {
	{ name = "crystal coin", chance = 12961, maxCount = 8 },
	{ name = "organic acid", chance = 11678, maxCount = 8 },
	{ name = "small emerald", chance = 9133, maxCount = 20 },
	{ name = "rotten roots", chance = 8637, maxCount = 8 },
	{ name = "bloated maggot", chance = 8133, maxCount = 8 },
	{ name = "blue gem", chance = 7000, maxCount = 8 },
	{ name = "violet gem", chance = 7000, maxCount = 8 },
	{ name = "yellow gem", chance = 7000, maxCount = 8 },
	{ name = "green gem", chance = 7000, maxCount = 8 },
	{ name = "terra rod", chance = 8078, maxCount = 2 },
	{ name = "butcher's axe", chance = 7967, maxCount = 2 },
	{ id = 23543, chance = 1230, maxCount = 2 }, -- collar of green plasma
	{ id = 23531, chance = 1220, maxCount = 2 }, -- ring of green plasma
	{ name = "tainted heart", chance = 2, maxCount = 5 },
	{ name = "darklight heart", chance = 2, maxCount = 5 },
	{ id = 34109, chance = 1},
	{ id = 39546, chance = 1},
	{ id = 43895, chance = 1},
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 20, minDamage = -0, maxDamage = -9800 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -11200, maxDamage = -25200, length = 8, spread = 3, effect = CONST_ME_GREEN_RINGS, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -11200, maxDamage = -28000, radius = 5, effect = CONST_ME_GROUNDSHAKER, target = false },
	{ name = "largepoisonring", interval = 2000, chance = 10, minDamage = -11200, maxDamage = -28000, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -2800, maxDamage = -8400, range = 7, target = false },
}

monster.defenses = {
	defense = 104,
	armor = 104,
	mitigation = 3.16,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -20 },
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
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster) 