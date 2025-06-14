local mType = Game.createMonsterType("Rei Aiolos")
local monster = {}

monster.description = "Rei Aiolos"
monster.experience = 3500000
monster.outfit = {
    lookType = 12,
    lookHead = 78,
    lookBody = 132,
    lookLegs = 39,
    lookFeet = 114,
    lookAddons = 3,
    lookMount = 0,
}

monster.events = {
    "DailyBossDeath",
}

monster.health = 25000000
monster.maxHealth = 25000000
monster.race = "holy"
monster.corpse = 6068
monster.speed = 370
monster.manaCost = 0

monster.changeTarget = {
    interval = 4000,
    chance = 35,
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
    { text = "Witness the wrath of the wind king!", yell = true },
    { text = "None shall escape my judgement!", yell = true },
}

monster.loot = {
    { id = 3043, chance = 60000, maxCount = 35 }, -- crystal coin
    { id = 3035, chance = 100000, maxCount = 70 }, -- platinum coin
    { id = 36728, chance = 1500 }, -- bestiary betterment
    { name = "holy falchion", chance = 800 },
    { name = "gold token", id = 22721, chance = 9000, maxCount = 15 },
}

monster.attacks = {
    { name = "melee", interval = 2000, chance = 100, skill = 250, attack = 2500 },
    { name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -2500, maxDamage = -5500, radius = 6, effect = CONST_ME_EXPLOSIONHIT, target = false },
    { name = "combat", interval = 3000, chance = 12, type = COMBAT_HOLYDAMAGE, minDamage = -3000, maxDamage = -6500, radius = 5, effect = CONST_ME_HOLYDAMAGE, target = false },
    { name = "combat", interval = 3500, chance = 10, type = COMBAT_HOLYDAMAGE, minDamage = -4000, maxDamage = -7000, range = 7, shootEffect = CONST_ANI_HOLY, effect = CONST_ME_HOLYDAMAGE, target = true },
    { name = "speed", interval = 4000, chance = 8, speedChange = -1000, radius = 6, effect = CONST_ME_MAGIC_RED, target = false, duration = 60000 },
}

monster.defenses = {
    defense = 180,
    armor = 200,
    { name = "combat", interval = 2000, chance = 20, type = COMBAT_HEALING, minDamage = 2000, maxDamage = 5000, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
    { type = COMBAT_PHYSICALDAMAGE, percent = 10 },
    { type = COMBAT_ENERGYDAMAGE, percent = 0 },
    { type = COMBAT_EARTHDAMAGE, percent = 0 },
    { type = COMBAT_FIREDAMAGE, percent = 0 },
    { type = COMBAT_LIFEDRAIN, percent = 0 },
    { type = COMBAT_MANADRAIN, percent = 0 },
    { type = COMBAT_DROWNDAMAGE, percent = 0 },
    { type = COMBAT_ICEDAMAGE, percent = 0 },
    { type = COMBAT_HOLYDAMAGE, percent = 20 },
    { type = COMBAT_DEATHDAMAGE, percent = -10 },
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

