local mType = Game.createMonsterType("Ancient Spawn of Morgathla")
local monster = {}

monster.description = "Ancient Spawn Of Morgathla"
monster.experience = 70000
monster.outfit = {
	lookType = 1055,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.bosstiary = {
	bossRaceId = 1551,
	bossRace = RARITY_ARCHFOE,
}

monster.health = 900000
monster.maxHealth = 900000
monster.race = "blood"
monster.corpse = 21004
monster.speed = 135
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 4,
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
}

monster.loot = {
	{ id = 7440, chance = 3236 }, -- mastermind potion
	{ id = 3035, chance = 2985, minCount = 150, maxCount = 350 }, -- platinum coin
	{ id = 3098, chance = 2562 }, -- ring of healing
	{ id = 16119, chance = 3581 }, -- blue crystal shard
	{ id = 3328, chance = 2108 }, -- daramian waraxe
	{ id = 16120, chance = 4927 }, -- violet crystal shard
	{ id = 9632, chance = 2986 }, -- ancient stone
	{ id = 7642, chance = 4176, minCount = 12, maxCount = 24 }, -- great spirit potion
	{ id = 16121, chance = 3275 }, -- green crystal shard
	{ id = 22193, chance = 4930 }, -- onyx chip
	{ id = 22516, chance = 4531 }, -- silver token
	{ id = 8084, chance = 2667 }, -- springsprout rod
	{ id = 238, chance = 4525, minCount = 12, maxCount = 24 }, -- great mana potion
	{ id = 5892, chance = 2314 }, -- huge chunk of crude iron
	{ id = 11454, chance = 3750 }, -- luminous orb
	{ id = 3018, chance = 2802 }, -- scarab amulet
	{ id = 830, chance = 2030 }, -- terra hood
	{ id = 7643, chance = 2203, minCount = 12, maxCount = 24 }, -- ultimate health potion
	{ id = 3037, chance = 2686 }, -- yellow gem
	{ id = 3041, chance = 1924 }, -- blue gem
	{ id = 7428, chance = 4079 }, -- bonebreaker
	{ id = 3339, chance = 3528 }, -- djinn blade
	{ id = 281, chance = 3572 }, -- giant shimmering pearl
	{ id = 22721, chance = 4001 }, -- gold token
	{ id = 3039, chance = 2743 }, -- red gem
	{ id = 3042, chance = 3092 }, -- scarab coin
	{ id = 3440, chance = 3306 }, -- scarab shield
	{ id = 3033, chance = 2840 }, -- small amethyst
	{ id = 3028, chance = 4146 }, -- small diamond
	{ id = 3032, chance = 2379 }, -- small emerald
	{ id = 3030, chance = 2382 }, -- small ruby
	{ id = 9057, chance = 2670 }, -- small topaz
	{ id = 8082, chance = 2956 }, -- underworld rod
	{ id = 27655, chance = 3708 }, -- plan for a makeshift armour
	{ id = 27657, chance = 4823 }, -- crude wood planks
	{ id = 27656, chance = 3202 }, -- tinged pot
	{ id = 8054, chance = 2545 }, -- earthborn titan armor
	{ id = 5904, chance = 4029 }, -- magic sulphur
	{ id = 812, chance = 3617 }, -- terra legs
	{ id = 9631, chance = 1698 }, -- scarab pincers
	{ id = 3043, chance = 2511 }, -- crystal coin
	{ id = 5891, chance = 3316 }, -- enchanted chicken wing
	{ id = 811, chance = 3472 }, -- terra mantle
	{ id = 3046, chance = 2164 }, -- magic light wand
	{ id = 12304, chance = 3281 }, -- maxilla maximus
	{ id = 3038, chance = 2907 }, -- green gem
	{ id = 3036, chance = 2003 }, -- violet gem
	{ id = 13998, chance = 4838 }, -- depth scutum
	{ id = 3025, chance = 3466 }, -- ancient amulet
	{ id = 14042, chance = 4859 }, -- warrior's shield
	{ id = 21981, chance = 4400 }, -- oriental shoes
	{ id = 27605, chance = 4999 }, -- candle stump
	{ id = 7382, chance = 4441 }, -- demonrage sword
	{ id = 3331, chance = 1951 }, -- ravager's axe
	{ id = 12509, chance = 3105 }, -- scorpion sceptre
	{ id = 8053, chance = 4176 }, -- fireborn giant armor
	{ id = 8062, chance = 3439 }, -- robe of the underworld
	{ id = 50176, chance = 1843 }, -- depth claws
	{ name = "gold token", maxCount = 3, chance = 5000 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 90, attack = 80 },
	{ name = "combat", interval = 2000, chance = 8, type = COMBAT_LIFEDRAIN, minDamage = -135, maxDamage = -280, range = 7, radius = 5, shootEffect = CONST_ANI_WHIRLWINDAXE, effect = CONST_ME_HITAREA, target = true },
	{ name = "combat", interval = 2000, chance = 8, type = COMBAT_PHYSICALDAMAGE, minDamage = -90, maxDamage = -200, range = 7, shootEffect = CONST_ANI_WHIRLWINDAXE, effect = CONST_ME_EXPLOSIONAREA, target = true },
}

monster.defenses = {
	defense = 190,
	armor = 190,
	--	mitigation = ???,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
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

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType:register(monster)
