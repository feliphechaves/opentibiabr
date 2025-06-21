local mType = Game.createMonsterType("Despor")
local monster = {}

monster.description = "Despor"
monster.experience = 55000
monster.outfit = {
	lookType = 1712,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.events = { "DesporDeath" }

monster.bosstiary = {
	bossRaceId = 2466,
	bossRace = RARITY_ARCHFOE,
}

monster.health = 112000
monster.maxHealth = 512000
monster.race = "blood"
monster.corpse = 44663
monster.speed = 170
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
	staticAttackChance = 90,
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
	{ text = "Just Look at me!", yell = false },
	{ text = "I'll stare you down", yell = false },
	{ text = "Let me have a look", yell = false },
}

monster.loot = {
	{ name = "crystal coin", chance = 11540, maxCount = 5 },
	{ name = "platinum coin", chance = 100000, maxCount = 200 },
	{ name = "strange helmet", chance = 23080 },
	{ name = "demonic essence", chance = 23080, maxCount = 2 },
	{ name = "life crystal", chance = 23080 },
	{ name = "yellow gem", chance = 15380 },
	{ name = "blue gem", chance = 15380, maxCount = 2 },
	{ name = "white gem", chance = 15380, maxCount = 2 },
	{ name = "giant sapphire", chance = 15380, maxCount = 2 },
	{ id = 7441, chance = 23080 },
	{ name = "dragonbone staff", chance = 23080 },
	{ name = "fire sword", chance = 23080 },
	{ name = "royal helmet", chance = 23080 },
	{ name = "dragon slayer", chance = 23080 },
	{ name = "crystallized blood", chance = 6980 },
	{ name = "exalted seal", chance = 6980 },
	{ name = "arcane dragon robe", chance = 500 },
	{ name = "mystical dragon robe", chance = 500 },
	{ name = "dauntless dragon scale armor", chance = 500 },
	{ name = "unerring dragon scale armor", chance = 500 },
	{ name = "merudri battle mail", chance = 500 },
	{ name = "herald's insignia", chance = 100 },
	{ name = "herald's wings", chance = 100 },
	{ name = "gold-scaled sentinel", chance = 1850 },
	{ name = "gold token", chance = 2000 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -2000, maxDamage = -3000 },
	{ name = "combat", interval = 2500, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -2000, maxDamage = -3000, range = 2, effect = CONST_ME_BIG_SCRATCH, target = true },
	{ name = "combat", interval = 2500, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -2000, maxDamage = -3000, length = 8, spread = 4, effect = CONST_ME_EXPLOSIONHIT, target = false },
	{ name = "combat", interval = 2500, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -2000, maxDamage = -3000, range = 7, radius = 4, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
	{ name = "combat", interval = 3000, chance = 5, type = COMBAT_PHYSICALDAMAGE, minDamage = -2000, maxDamage = -3000, radius = 4, effect = CONST_ME_POFF, target = true },
	{ name = "death chain", interval = 2500, chance = 15, minDamage = -200, maxDamage = -2000, range = 7 },
}

monster.defenses = {
	defense = 76,
	armor = 76,
	mitigation = 1.96,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 25 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
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
