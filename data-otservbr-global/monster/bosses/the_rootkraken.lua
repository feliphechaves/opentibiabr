local mType = Game.createMonsterType("The Rootkraken")
local monster = {}

monster.description = "the rootkraken"
monster.experience = 3700000
monster.outfit = {
	lookType = 1765,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}
monster.events = {}

monster.bosstiary = {
	bossRaceId = 2528,
	bossRace = RARITY_ARCHFOE,
}

monster.health = 1400000
monster.maxHealth = 1400000
monster.race = "blood"
monster.corpse = 49120
monster.speed = 170
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
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 95,
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

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Chrrrk!", yell = false },
}

monster.loot = {
	{ name = "crystal coin", chance = 100000, maxCount = 3 },
	{ name = "platinum coin", chance = 100000, maxCount = 93 },
	{ name = "ultimate health potion", chance = 42590, maxCount = 19 },
	{ name = "great spirit potion", chance = 42590, maxCount = 7 },
	{ name = "great mana potion", chance = 31480, maxCount = 14 },
	{ name = "supreme health potion", chance = 31480, maxCount = 4 },
	{ name = "ultimate spirit potion", chance = 25930, maxCount = 14 },
	{ id = 3037, chance = 24070 }, -- yellow gem
	{ name = "amber with a bug", chance = 18520 },
	{ name = "giant topaz", chance = 7410 },
	{ name = "amber crusher", chance = 1850 },
	{ id = 47375, chance = 300 }, -- amber axe
	{ id = 47369, chance = 200 }, -- amber greataxe
	{ id = 47368, chance = 200 }, -- amber slayer
	{ id = 47374, chance = 300 }, -- amber sabre
	{ id = 47376, chance = 300 }, -- amber cudgel
	{ id = 47370, chance = 200 }, -- amber bludgeon
	{ id = 47371, chance = 200 }, -- amber bow
	{ id = 47377, chance = 300 }, -- amber crossbow
	{ id = 47372, chance = 300 }, -- amber wand
	{ id = 47373, chance = 300 }, -- amber rod
	{ id = 48514, chance = 250 }, -- strange inedible fruit
}

monster.attacks = {
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -1000, maxDamage = -4500, length = 8, spread = 0, effect = CONST_ME_SMALLPLANTS },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -1500, maxDamage = -4100, effect = CONST_ME_SMALLPLANTS },
	{ name = "melee", interval = 2000, chance = 100, skill = 200, attack = 250 },
	{ name = "speed", interval = 2000, chance = 10, speedChange = -300, range = 7, effect = CONST_ME_MAGIC_RED, target = false, duration = 15000 },
	{ name = "rootkrakendeath", interval = 4000, chance = 6, target = false },
	{ name = "combat", interval = 2000, chance = 13, type = COMBAT_EARTHDAMAGE, minDamage = -1200, maxDamage = -1400, length = 8, spread = 3, effect = CONST_ME_SMALLPLANTS, target = false },
}

monster.defenses = {
	defense = 76,
	armor = 76,
	mitigation = 2.02,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 15 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = -15 },
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

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType:register(monster)
