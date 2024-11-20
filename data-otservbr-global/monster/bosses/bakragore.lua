local mType = Game.createMonsterType("Bakragore")
local monster = {}

monster.description = "Bakragore"
monster.experience = 20000000
monster.outfit = {
	lookType = 1671,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.events = {
	"RottenBloodBakragoreDeath",
}

monster.bosstiary = {
	bossRaceId = 2367,
	bossRace = RARITY_NEMESIS,
}

monster.health = 1000000
monster.maxHealth = 1000000
monster.race = "undead"
monster.corpse = 44012
monster.speed = 250
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 20,
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
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 98,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.summon = {
	maxSummons = 4,
	summons = {
		{ name = "Elder Bloodjaw", chance = 20, interval = 2000, count = 4 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Light ... darkens!", yell = false },
	{ text = "Light .. the ... darkness!", yell = false },
	{ text = "Darkness ... is ... light!", yell = false },
	{ text = "WILL ... PUNISH ... YOU!", yell = false },
	{ text = "RAAAR!", yell = false },
}

monster.loot = {
	{ name = "crystal coin", chance = 8938, maxCount = 200 },
	{ name = "supreme health potion", chance = 8938, maxCount = 300 },
	{ name = "ultimate mana potion", chance = 11433, maxCount = 300 },
	{ name = "ultimate spirit potion", chance = 11433, maxCount = 300 },
	{ name = "berserk potion", chance = 10938, maxCount = 90 },
	{ name = "bullseye potion", chance = 10938, maxCount = 90 },
	{ name = "mastermind potion", chance = 10938, maxCount = 30 },
	{ name = "blue gem", chance = 10570, maxCount = 10 },
	{ name = "giant amethyst", chance = 10570, maxCount = 10 },
	{ name = "giant emerald", chance = 10570, maxCount = 10 },
	{ name = "giant ruby", chance = 10570, maxCount = 10 },
	{ id = 3039, chance = 10570, maxCount = 10 },
	{ name = "giant sapphire", chance = 10570, maxCount = 10 },
	{ name = "giant topaz", chance = 10570, maxCount = 10 },
	{ name = "violet gem", chance = 10970, maxCount = 10 },
	{ name = "yellow gem", chance = 10970, maxCount = 10 },
	{ name = "figurine of bakragore", chance = 10970 },
	{ name = "bakragore's amalgamation", chance = 570 },
	{ name = "spiritual horseshoe", chance = 470 },
	{ id = 43895, chance = 300 }, -- Bag you covet
}

monster.attacks = {
	{name="melee" ,interval="2000" ,minDamage="-7000" ,maxDamage="-9000"},	
	{name ="combat", interval = 2000, chance = 40, type = COMBAT_DEATHDAMAGE, minDamage = -3200, maxDamage = -6800, effect = CONST_ME_MORTAREA, length = 8, spread = 3, target = false},	
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -3500, maxDamage = -5200, effect = CONST_ME_MORTAREA, radius = 4, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -3020, maxDamage = -5000, range = 7, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_MORTAREA, target = true},	
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -3500, maxDamage = -5000, radius = 40, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 4000, chance = 35, type = COMBAT_ENERGYDAMAGE, minDamage = -3600, maxDamage = -4050, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = true},
	{name ="combat", interval = 2000, chance = 35, type = COMBAT_ICEDAMAGE, minDamage = -5950, maxDamage = -5500, range = 7, shootEffect = CONST_ANI_SNOWBALL, effect = CONST_ME_ICEATTACK, target = true},
	{name ="combat", interval = 2000, chance = 30, type = COMBAT_ICEDAMAGE, minDamage = -5500, maxDamage = -5800, range = 7, radius = 5, shootEffect = CONST_ANI_ICE, effect = CONST_ME_ICEAREA, target = true},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -5850, maxDamage = -6200, radius = 4, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true},
	{name ="combat", interval = 2000, chance = 17, type = COMBAT_HOLYDAMAGE, minDamage = -3500, maxDamage = -5200, radius = 3, effect = CONST_ME_HOLYAREA, target = false},
	{name ="combat", interval = 3000, chance = 25, type = COMBAT_HOLYDAMAGE, minDamage = -3100, maxDamage = -4100, radius = 4, effect = CONST_ME_HOLYDAMAGE, target = false},
	{name ="combat", interval = 2000, chance = 35, type = COMBAT_FIREDAMAGE, minDamage = -3950, maxDamage = -4600, range = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 2000, chance = 35, type = COMBAT_FIREDAMAGE, minDamage = -5000, maxDamage = -5450, length = 8, effect = CONST_ME_EXPLOSIONHIT, target = true},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -3400, maxDamage = -4750, length = 5, radius = 2, effect = CONST_ME_GREEN_RINGS, target = false},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -3566, maxDamage = -4420, length = 8, spread = 3, effect = CONST_ME_CARNIPHILA, target = false},
	{name ="stone shower rune", interval = 2000, chance = 10, minDamage = -3230, maxDamage = -5950, range = 7, target = false},
	{name ="combat", interval = 2000, chance = 40, type = COMBAT_EARTHDAMAGE, minDamage = -3850, maxDamage = -4400, radius = 7, effect = CONST_ME_BIGPLANTS, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -3950, maxDamage = -5250, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true}
}

monster.defenses = {
	defense = 135,
	armor = 135,
	{ name = "combat", interval = 3000, chance = 15, type = COMBAT_HEALING, minDamage = 2500, maxDamage = 3500, effect = 236, target = false },
	{ name = "speed", interval = 4000, chance = 80, speedChange = 700, effect = CONST_ME_MAGIC_RED, target = false, duration = 6000 },
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -10},
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = -10},
	{type = COMBAT_FIREDAMAGE, percent = -20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 40},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType.onThink = function(monster, interval) end

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType.onDisappear = function(monster, creature) end

mType.onMove = function(monster, creature, fromPosition, toPosition) end

mType.onSay = function(monster, creature, type, message) end

mType:register(monster)
