local mType = Game.createMonsterType("Arbaziloth")
local monster = {}

monster.description = "Arbaziloth"
monster.experience = 20000000
monster.outfit = {
	lookType = 1798,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.events = {
}

monster.bosstiary = {
	bossRaceId = 2594,
	bossRace = RARITY_NEMESIS,
}

monster.health = 3000000
monster.maxHealth = 3000000
monster.race = "undead"
monster.corpse = 50029
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
	maxSummons = 6,
	summons = {
		{ name = "Broodrider Inferniarch", chance = 20, interval = 2000, count = 2 },
		{ name = "Gorger Inferniarch", chance = 20, interval = 2000, count = 2 },
		{ name = "Sineater Inferniarch", chance = 20, interval = 2000, count = 2 },
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
	{ name = "crystal coin", chance = 12500, maxCount = 500 },
	{ name = "supreme health potion", chance = 8938, maxCount = 300 },
	{ name = "ultimate mana potion", chance = 11433, maxCount = 300 },
	{ name = "ultimate spirit potion", chance = 11433, maxCount = 300 },
	{ name = "berserk potion", chance = 10938, maxCount = 90 },
	{ name = "bullseye potion", chance = 10938, maxCount = 90 },
	{ name = "mastermind potion", chance = 10938, maxCount = 30 },
	{ name = "blue gem", chance = 5000, maxCount = 10 },
	{ name = "giant amethyst", chance = 5000, maxCount = 10 },
	{ name = "giant emerald", chance = 5000, maxCount = 10 },
	{ name = "giant ruby", chance = 5000, maxCount = 10 },
	{ id = 3039, chance = 5000, maxCount = 10 },
	{ name = "giant sapphire", chance = 5000, maxCount = 10 },
	{ name = "giant topaz", chance = 5000, maxCount = 10 },
	{ name = "violet gem", chance = 5000, maxCount = 10 },
	{ name = "yellow gem", chance = 5000, maxCount = 10 },
	{ name = "devil helmet", chance = 5000 },
	{ name = "fire axe", chance = 5000 },
	{ name = "fire sword", chance = 5000 },
	{ name = "giant sword", chance = 5000 },
	{ name = "gold ring", chance = 5000 },
	{ name = "golden sickle", chance = 5000 },
	{ name = "ice rapier", chance = 5000 },
	{ name = "magma amulet", chance = 5000 },
	{ name = "magma legs", chance = 5000 },
	{ name = "might ring", chance = 5000 },
	{ name = "platinum amulet", chance = 5000 },
	{ name = "purple tome", chance = 5000 },
	{ name = "silver amulet", chance = 5000 },
	{ name = "skull staff", chance = 5000 },
	{ name = "spellweaver's robe", chance = 5000 },
	{ name = "stone skin amulet", chance = 5000 },
	{ name = "strange helmet", chance = 5000 },
	{ name = "underworld rod", chance = 5000 },
	{ name = "wand of inferno", chance = 5000 },
	{ name = "demon shield", chance = 5000 },
	{ name = "demonbone amulet", chance = 5000 },
	{ name = "demonrage sword", chance = 5000 },
	{ name = "golden legs", chance = 5000 },
	{ name = "magic plate armor", chance = 5000 },
	
	{ name = "gold token", chance = 5000, maxCount = 10 },

	{ id = 4115, chance = 300 },


}

monster.attacks = {
    -- Melee físico forte
    { name = "melee", interval = 2000, chance = 100, minDamage = -20000, maxDamage = -30000 },

    -- Death Damage em área 3x3
    { name = "combat", interval = 4000, chance = 20, type = COMBAT_DEATHDAMAGE, range = 1, radius = 8, effect = CONST_ME_MORTAREA, target = false, minDamage = -40000, maxDamage = -50000 },

    -- Energy em onda (wave horizontal ou vertical)
    { name = "combat", interval = 6000, chance = 25, type = COMBAT_ENERGYDAMAGE, length = 8, spread = 4, effect = CONST_ME_ENERGYHIT, minDamage = -40000, maxDamage = -50000 },

    -- Life Drain 5x5
    { name = "combat", interval = 7000, chance = 15, type = COMBAT_LIFEDRAIN, radius = 2, target = false, effect = CONST_ME_MAGIC_RED, minDamage = -40000, maxDamage = -50000 },

    --Linha frontal que "mata" com 200k de dano
    { name = "combat", interval = 10000, chance = 25, type = COMBAT_PHYSICALDAMAGE, length = 8, spread = 0, effect = CONST_ME_EXPLOSIONAREA, minDamage = -250000, maxDamage = -250000 },
}


monster.defenses = {
	defense = 135,
	armor = 135,
	--{ name = "combat", interval = 3000, chance = 15, type = COMBAT_HEALING, minDamage = 2500, maxDamage = 3500, effect = 236, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 30 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 27 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 15 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 20 },
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
