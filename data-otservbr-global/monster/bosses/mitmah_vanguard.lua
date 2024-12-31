local mType = Game.createMonsterType("Mitmah Vanguard")
local monster = {}

monster.description = "Mitmah Vanguard"
monster.experience = 1300000
monster.outfit = {
	lookType = 1716,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.bosstiary = {
	bossRaceId = 2464,
	bossRace = RARITY_ARCHFOE,
}

monster.health = 1065000
monster.maxHealth = 1065000
monster.race = "venom"
monster.corpse = 44686
monster.speed = 120
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8,
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
	rewardBoss = true,
	illusionable = true,
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
monster.summon = {
	maxSummons = 4,
	summons = {
		{ name = "Mitmah Scout", chance = 100, interval = 2000, count = 2 },
		{ name = "Iks Yapunac", chance = 100, interval = 2000, count = 2 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Die, human. Now!", yell = true },
	{ text = "FEAR THE CURSE!", yell = true },
	{ text = "You're the intruder.", yell = true },
	{ text = "GOT YOU NOW!", yell = true },
}

monster.loot = {
	{ id = 44622, chance = 440 },
	{ id = 44623, chance = 440, maxCount = 1 },
	{ id = 44621, chance = 440 },
	{ id = 44648, chance = 450 },
	{ id = 44636, chance = 450 },
	{ id = 44620, chance = 450 },
	{ id = 44642, chance = 450 },
	{ id = 44643, chance = 450 },
	{ id = 44637, chance = 450 },
	{ id = 44649, chance = 450 },
	{ id = 44619, chance = 450 },
	{ name = "Gold Coin", chance = 9650, maxCount = 400 },
	{ name = "Crystal Coin", chance = 5700,  maxCount = 2 },
	{ name = "Great Spirit Potion", chance = 2450 },
	{ name = "Ultimate Mana Potion", chance = 5450, maxCount = 15 },
	{ name = "Ultimate Health Potion", chance = 5450, maxCount = 15 },
	{ name = "Platinum Coin", chance = 2450, maxCount = 15 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -1100, maxDamage = -5520 },
	--{ name = "mitmah soulfire", interval = 2000, chance = 2, target = false },
	{ name = "combat", interval = 3000, chance = 40, type = COMBAT_FIREDAMAGE, minDamage = -3000, maxDamage = -3500, length = 10, spread = 3, effect = CONST_ANI_FIRE, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -1450, maxDamage = -2750, range = 3, radius = 6, effect = 45, target = false },
	--{ name = "energy strike", interval = 2000, chance = 10, minDamage = -1350, maxDamage = -2500, range = 1, target = true },
	{ name = "combat", interval = 2500, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -4000, maxDamage = -9000, radius = 5, effect = CONST_ME_PURPLESMOKE, target = true },
	--{ name = "mitmah electrify", interval = 2000, chance = 10, minDamage = -1100, maxDamage = -2720, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -4000, maxDamage = -10000, length = 8, spread = 3, effect = CONST_ME_ELECTRICALSPARK, target = false },
	--{ name = "mitmah ring", interval = 2000, chance = 10, minDamage = -1300, maxDamage = -2820, target = false },
	--{ name = "mitmah fire", interval = 2000, chance = 10, minDamage = -1200, maxDamage = -2720, target = false },
	{ name = "largefirering", interval = 2500, chance = 15, minDamage = -1500, maxDamage = -4500, target = false },
}

monster.defenses = {
	defense = 45,
	armor = 45,
	mitigation = 3.00,
	{ name = "combat", interval = 2000, chance = 8, type = COMBAT_HEALING, minDamage = 2500, maxDamage = 5000, effect = CONST_ME_MAGIC_GREEN, target = false },

}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 30 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 50 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = true },
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

