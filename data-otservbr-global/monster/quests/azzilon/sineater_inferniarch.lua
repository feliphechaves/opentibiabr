local mType = Game.createMonsterType("Sineater Inferniarch")
local monster = {}

monster.description = "a sineater inferniarch"
monster.experience = 252000
monster.outfit = {
	lookType = 1795,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 2602
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

monster.health = 308000
monster.maxHealth = 308000
monster.race = "fire"
monster.corpse = 50002
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
    { name = "great mana potion", chance = 5000, maxCount = 5 }, -- 40%
    { name = "small ruby", chance = 5000, maxCount = 5 }, -- 40%
    { name = "demonic core essence", chance = 3000, maxCount = 1 }, -- 24%
    { name = "sineater wing", chance = 3000, maxCount = 1 }, -- 24%
    { name = "ruby necklace", chance = 3000, maxCount = 1 }, -- 24%
    { name = "wand of defiance", chance = 2000, maxCount = 1 }, -- 16%

    -- Raro (~8%–2% após x8)
    { name = "mummified demon finger", chance = 1000, maxCount = 1 }, -- 8%
    { name = "demonic matter", chance = 500, maxCount = 1 }, -- 4%
    { name = "wooden spellbook", chance = 500, maxCount = 1 }, -- 4%

}

monster.attacks = {
    -- Melee físico (corpo a corpo forte)
    { name = "melee", interval = 1000, chance = 100, minDamage = -0, maxDamage = -6000 },
    -- Fire (Energia) à distância
    { name = "combat", interval = 1000, chance = 50, type = COMBAT_FIREDAMAGE, minDamage = -2500, maxDamage = -4500, range = 7, radius = 4, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
    { name = "firefield", interval = 2000, chance = 10, range = 7, radius = 4, shootEffect = CONST_ANI_FIRE, target = true },
    -- Death Strike (alvo único à distância)
    { name = "combat", interval = 1500, chance = 25, type = COMBAT_DEATHDAMAGE, minDamage = -2500, maxDamage = -4500, range = 7, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_MORTAREA, target = true },
    -- Death Ball (5x5 em área)
    { name = "combat", interval = 3000, chance = 50, type = COMBAT_DEATHDAMAGE, minDamage = -2500, maxDamage = -5000, radius = 5, effect = CONST_ME_MORTAREA, target = false }
}

monster.defenses = {
	defense = 104,
	armor = 104,
	mitigation = 3.16,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -5 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
