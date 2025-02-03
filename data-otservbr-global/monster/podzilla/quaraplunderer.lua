local mType = Game.createMonsterType("Quara Plunderer")
local monster = {}

monster.description = "a quara plunderer"
monster.experience = 73636
monster.outfit = {
	lookType = 1758,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 2542
monster.Bestiary = {
	class = "Aquatic",
	race = BESTY_RACE_AQUATIC,
	toKill = 2500,
	FirstUnlock = 200,
	SecondUnlock = 2500,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 1,
	Locations = "Podzilla Bottom, Podzilla Underwater ",
}

monster.health = 90000
monster.maxHealth = 90000
monster.race = "undead"
monster.corpse = 48391
monster.speed = 250
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 11,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 300,
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

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Tssssh!!!", yell = false },
	{ text = "BLUP! BLUP!", yell = false },
	{ text = "Burp!", yell = false },
}

monster.loot = {
	{ name = "crystal coin", chance = 12380, maxCount = 17 },
    --{ id = 45654, chance = 4600, maxCount = 1 }, 
    { id = 13990, chance = 4600, maxCount = 1 },
	{ id = 32622, chance = 4600, maxCount = 1 },
    { id = 3041, chance = 4600, maxCount = 1 },
    { id = 48508, chance = 4600, maxCount = 1 },
    { id = 11490, chance = 4600, maxCount = 1 },
	{ id = 7407, chance = 4600, maxCount = 1 },
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -1250, maxDamage = -1500},
	{name ="combat", interval = 2000, chance = 50, type = COMBAT_ICEDAMAGE, minDamage = -1550, maxDamage = -2900, range = 7, radius = 4, shootEffect = CONST_ANI_ICE, effect = CONST_ME_BIGCLOUDS, target = true},
	{name ="combat", interval = 2000, chance = 30, type = COMBAT_PHYSICALDAMAGE, minDamage = -1550, maxDamage = -2900, radius = 3, effect = CONST_ME_GROUNDSHAKER, target = false},
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -1450, maxDamage = -2900, length = 5, spread = 3, effect = CONST_ME_ENERGYHIT, target = false },
}

monster.defenses = {
	defense = 95,
	armor = 95,
	mitigation = 2.75,
	{ name = "combat", interval = 2000, chance = 7, type = COMBAT_HEALING, minDamage = 1400, maxDamage = 2000, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 10, speedChange = 520, effect = CONST_ME_POFF, target = false, duration = 5000 },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 15 },
	{ type = COMBAT_FIREDAMAGE, percent = -20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
