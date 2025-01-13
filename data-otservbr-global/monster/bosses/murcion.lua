local mType = Game.createMonsterType("Murcion")
local monster = {}

monster.description = "Murcion"
monster.experience = 3250000
monster.outfit = {
	lookType = 1664,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.events = {
	"RottenBloodBossDeath",
	"SummonElderBloodJaw",
}

monster.bosstiary = {
	bossRaceId = 2362,
	bossRace = RARITY_NEMESIS,
}

monster.health = 600000
monster.maxHealth = 600000
monster.race = "undead"
monster.corpse = 44015
monster.speed = 350
monster.manaCost = 0
monster.maxSummons = 8

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
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
	pet = false,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.summon = {
	maxSummons = 8,
	summons = {},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "The light... that... drains!", yell = false },
}

monster.loot = {
	{ name = "crystal coin", chance = 12317, maxCount = 91 },
	{ id = 3039, chance = 10896, maxCount = 2 }, -- red gem
	{ name = "amber with a bug", chance = 14590, maxCount = 1 },
	{ name = "amber with a dragonfly", chance = 5405, maxCount = 1 },
	{ name = "bullseye potion", chance = 10821, maxCount = 44 },
	{ name = "green gem", chance = 7763, maxCount = 4 },
	{ name = "mastermind potion", chance = 9534, maxCount = 15 },
	{ name = "supreme health potion", chance = 6212, maxCount = 102 },
	{ name = "ultimate mana potion", chance = 8785, maxCount = 29 },
	{ name = "ultimate spirit potion", chance = 8783, maxCount = 161 },
	{ name = "tainted heart", chance = 50, maxCount = 5 },
	{ name = "darklight heart", chance = 15, maxCount = 5 },
	{ id = 43899, chance = 100 }, --cursed wood
	{ id = 43895, chance = 100 }, -- Bag you covet
}

monster.attacks = {
	{ name = "melee", interval = "2000", minDamage = 0, maxDamage = -5100 },
	{ name = "combat", interval = 2000, chance = 40, type = COMBAT_DEATHDAMAGE, minDamage = -1200, maxDamage = -4800, length = 8, spread = 3, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -1500, maxDamage = -3200, radius = 4, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -1020, maxDamage = -3000, range = 7, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_MORTAREA, target = true },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -1500, maxDamage = -3000, radius = 40, effect = CONST_ME_MORTAREA, target = false },
	{ name = "melee", interval = 2000, chance = 100, minDamage = -1900, maxDamage = -2750 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -1566, maxDamage = -2420, length = 8, spread = 3, effect = CONST_ME_CARNIPHILA, target = false },
	{ name = "stone shower rune", interval = 2000, chance = 10, minDamage = -1230, maxDamage = -1950, range = 7, target = false },
	{ name = "combat", interval = 2000, chance = 40, type = COMBAT_EARTHDAMAGE, minDamage = -1850, maxDamage = -2400, radius = 7, effect = CONST_ME_BIGPLANTS, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -1950, maxDamage = -3250, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
}

monster.defenses = {
	defense = 105,
	armor = 105,
	{ name = "combat", interval = 3000, chance = 10, type = COMBAT_HEALING, minDamage = 800, maxDamage = 1500, effect = 236, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 30 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 40 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
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
