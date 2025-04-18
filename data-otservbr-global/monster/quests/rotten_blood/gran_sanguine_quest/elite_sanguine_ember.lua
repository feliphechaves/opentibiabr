local mType = Game.createMonsterType("Elite Sanguine Ember")
local monster = {}

monster.description = "an elite sanguine ember"
monster.experience = 380000
monster.outfit = {
	lookType = 2514,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 2581
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

monster.health = 440000
monster.maxHealth = 440000
monster.race = "fire"
monster.corpse = 8136
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
	canWalkOnFire = true,
	canWalkOnPoison = false,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.events = {
	"SanguineEmberDeath",
}

monster.voices = {}

monster.loot = {
	{ name = "crystal coin", chance = 12961, maxCount = 8 },
	{ name = "darklight core", chance = 12887, maxCount = 8 },
	{ name = "dark obsidian splinter", chance = 11678, maxCount = 8 },
	{ name = "basalt crumbs", chance = 8637, maxCount = 8 },
	{ name = "small sapphire", chance = 9133, maxCount = 16 },
	{ name = "small emerald", chance = 9133, maxCount = 16 },
	{ name = "butcher's axe", chance = 7967, maxCount = 4 },
	{ name = "fire axe", chance = 7967, maxCount = 4 },
	{ name = "fire sword", chance = 7967, maxCount = 4 },
	{ name = "blue gem", chance = 7808, maxCount = 8 },
	{ name = "violet gem", chance = 7084, maxCount = 8 },
	{ name = "tainted heart", chance = 2, maxCount = 5 },
	{ name = "darklight heart", chance = 2, maxCount = 5 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 20, minDamage = -0, maxDamage = -14000 },
	{ name = "combat", interval = 3000, chance = 35, type = COMBAT_FIREDAMAGE, minDamage = -10000, maxDamage = -14000, range = 7, radius = 4, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
	{ name = "combat", interval = 3000, chance = 40, type = COMBAT_FIREDAMAGE, minDamage = -12000, maxDamage = -14000, length = 10, spread = 3, effect = CONST_ANI_FIRE, target = false },
	{ name = "largefirering", interval = 2500, chance = 15, minDamage = -6000, maxDamage = -18000, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -4000, maxDamage = -12000, range = 7, target = false },
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
	{ type = COMBAT_ICEDAMAGE, percent = -20 },
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