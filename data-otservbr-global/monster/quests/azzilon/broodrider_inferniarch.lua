local mType = Game.createMonsterType("Broodrider Inferniarch")
local monster = {}

monster.description = "a broodrider inferniarch"
monster.experience = 252000
monster.outfit = {
	lookType = 1796,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 2603
monster.Bestiary = {
	class = "Demon",
	race = BESTY_RACE_DEMON,
	toKill = 10000,
	FirstUnlock = 200,
	SecondUnlock = 2000,
	CharmsPoints = 100,
	Stars = 5,
	Occurrence = 0,
}

monster.health = 208000
monster.maxHealth = 208000
monster.race = "fire"
monster.corpse = 50006
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
	targetDistance = 4,
	runHealth = 0,
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

monster.voices = {}

monster.loot = {
	-- Comum (~100% após x8)
    { name = "platinum coin", chance = 12500, maxCount = 25 }, -- 12500 x 8 = 100000 (100%)

    -- Semi-Raro (~40%–10% após x8)
    { name = "blue crystal splinter", chance = 5000, maxCount = 5 }, -- 40%
    { name = "drill bolt", chance = 3000, maxCount = 1 }, -- 24%
    { name = "power bolt", chance = 2500, maxCount = 1 }, -- 20%
    { name = "onyx chip", chance = 2000, maxCount = 1 }, -- 16%
    { name = "broodrider saddle", chance = 2000, maxCount = 1 }, -- 16%
    { name = "demonic core essence", chance = 2000, maxCount = 1 }, -- 16%
    
    -- Raro (~8%–2% após x8)
    { name = "mummified demon finger", chance = 2000, maxCount = 1 }, -- 8%
    { name = "magma legs", chance = 2000, maxCount = 1 }, -- 8%
    { name = "demonic matter", chance = 2000, maxCount = 1 }, -- 4%
    { name = "arbalest", chance = 2000, maxCount = 1 },

}

monster.attacks = {
    -- Arco (corpo a corpo forte)
    { name = "combat", interval = 1000, chance = 90, type = COMBAT_PHYSICALDAMAGE, minDamage = -3000, maxDamage = -6000, range = 7, shootEffect = CONST_ANI_DIAMONDARROW, target = false },
    -- Death Strike (alvo único à distância)
    { name = "combat", interval = 1500, chance = 25, type = COMBAT_DEATHDAMAGE, minDamage = -2500, maxDamage = -4500, range = 7, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_MORTAREA, target = true },
}

monster.defenses = {
	defense = 104,
	armor = 104,
	mitigation = 3.16,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 10 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -15 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 15 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
