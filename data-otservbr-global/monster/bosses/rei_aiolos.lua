local mType = Game.createMonsterType("Rei Aiolos")
local monster = {}

monster.description = "Rei Aiolos"
monster.experience = 3500000
monster.outfit = {
    lookType = 1206,
    lookHead = 78,
    lookBody = 132,
    lookLegs = 39,
    lookFeet = 114,
    lookAddons = 3,
    lookMount = 1578,
}

monster.events = {
    "DailyBossDeath",
}

monster.health = 30000000
monster.maxHealth = 30000000
monster.race = "blood"
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
    { text = "Morram invasores!", yell = true },
}

monster.loot = {
    { id = 3051, chance = 13500 }, -- energy ring
	{ name = "platinum coin", chance = 69900, maxCount = 100 },
	{ name = "crystal coin", chance = 47700, maxCount = 40 },
	{ name = "giant ruby", chance = 31500 },
	{ name = "giant sapphire", chance = 31500 },
	{ name = "giant emerald", chance = 31500 },
	{ name = "thunder hammer", chance = 3500 },
	{ id = 3002, chance = 1100 }, -- voodoo doll
	{ id = 12599, chance = 1000 }, --mages cap
	{ id = 12803, chance = 1000 }, --Elemental Spikes
	{ id = 20276, chance = 1000 }, --dream warden mask
	{ id = 20275, chance = 1000 }, --Dream Warden Claw
	{ id = 5919, chance = 1000 }, --dragon claw
	{ id = 40578, chance = 1000 }, --the living idol of tukh
	{ id = 40531, chance = 1000 }, --broken Iks faulds
	{ id = 40532, chance = 1000 }, --broken Iks headpiece
	{ id = 40533, chance = 1000 }, --broken Iks cuirass
	{ id = 40534, chance = 1000 }, --Broken Iks Sandals
	{ id = 36725, chance = 1500 }, -- stamina refill
	{ id = 36727, chance = 1500 }, -- wealth duplex
	{ id = 34109, chance = 1000 }, -- bag you desire
	{ name = "falcon battleaxe", chance = 600, maxCount = 1 },
	{ name = "falcon longsword", chance = 600, maxCount = 1 },
	{ name = "falcon mace", chance = 600, maxCount = 1 },
	{ name = "grant of arms", chance = 600, maxCount = 1 },
	{ name = "falcon bow", chance = 600, maxCount = 1 },
	{ name = "falcon circlet", chance = 600, maxCount = 1 },
	{ name = "falcon coif", chance = 600, maxCount = 1 },
	{ name = "falcon rod", chance = 600, maxCount = 1 },
	{ name = "falcon wand", chance = 600, maxCount = 1 },
	{ name = "falcon shield", chance = 600, maxCount = 1 },
	{ name = "falcon greaves", chance = 600, maxCount = 1 },
	{ name = "falcon plate", chance = 600, maxCount = 1 },
	{ name = "cobra club", chance = 700 },
	{ name = "cobra axe", chance = 600 },
	{ name = "cobra crossbow", chance = 600 },
	{ name = "cobra hood", chance = 400 },
	{ name = "cobra rod", chance = 650 },
	{ name = "cobra sword", chance = 650 },
	{ name = "cobra wand", chance = 650 },
	{ name = "cobra amulet", chance = 600 },
	{ name = "lion spangenhelm", chance = 600 },
	{ name = "lion plate", chance = 600 },
	{ name = "lion shield", chance = 600 },
	{ name = "lion longsword", chance = 600 },
	{ name = "lion hammer", chance = 600 },
	{ name = "lion axe", chance = 600 },
	{ name = "lion longbow", chance = 600 },
	{ name = "lion spellbook", chance = 600 },
	{ name = "lion wand", chance = 600 },
	{ name = "lion amulet", chance = 600 },
	{ name = "lion rod", chance = 600 },
	{ name = "eldritch breeches", chance = 600 },
	{ name = "eldritch cowl", chance = 600 },
	{ name = "eldritch hood", chance = 600 },
	{ name = "eldritch bow", chance = 600 },
	{ name = "eldritch quiver", chance = 600 },
	{ name = "eldritch claymore", chance = 600 },
	{ name = "eldritch greataxe", chance = 600 },
	{ name = "eldritch warmace", chance = 600 },
	{ name = "eldritch shield", chance = 600 },
	{ name = "eldritch cuirass", chance = 600 },
	{ name = "eldritch folio", chance = 600 },
	{ name = "eldritch tome", chance = 600 },
	{ name = "eldritch rod", chance = 600 },
	{ name = "eldritch wand", chance = 600 },
	{ name = "gilded eldritch claymore", chance = 600 },
	{ name = "gilded eldritch greataxe", chance = 600 },
	{ name = "gilded eldritch warmace", chance = 600 },
	{ name = "gilded eldritch wand", chance = 600 },
	{ name = "gilded eldritch rod", chance = 600 },
	{ name = "gilded eldritch bow", chance = 600 },
	{ name = "eldritch crystal", chance = 600 },
	{ name = "alchemist's notepad", chance = 600 },
	{ name = "antler-horn helmet", chance = 600 },
	{ name = "mutant bone kilt", chance = 600 },
	{ name = "mutated skin armor", chance = 600 },
	{ name = "mutated skin legs", chance = 600 },
	{ name = "stitched mutant hide legs", chance = 600 },
	{ name = "alchemist's boots", chance = 600 },
	{ name = "mutant bone boots", chance = 600 },
	{ name = "dawnfire sherwani", chance = 600 },
	{ name = "frostflower boots", chance = 600 },
	{ name = "feverbloom boots", chance = 600 },
	{ id = 39233, chance = 600 }, -- enchanted turtle amulet
	{ name = "midnight tunic", chance = 600 },
	{ name = "midnight sarong", chance = 600 },
	{ name = "naga quiver", chance = 600 },
	{ name = "naga sword", chance = 600 },
	{ name = "naga axe", chance = 600 },
	{ name = "naga club", chance = 600 },
	{ name = "naga wand", chance = 600 },
	{ name = "naga rod", chance = 600 },
	{ name = "naga crossbow", chance = 600 },
	{ name = "arboreal tome", chance = 600 },
	{ name = "arboreal crown", chance = 600 },
	{ name = "spiritthorn armor", id = 39147, chance = 600 },
	{ name = "spiritthorn helmet", id = 39148, chance = 600 },
	{ name = "alicorn headguard", chance = 600 },
	{ name = "alicorn quiver", chance = 600 },
	{ name = "arcanomancer regalia", chance = 600 },
	{ name = "arcanomancer folio", chance = 600 },
	{ id = 39183, chance = 600 }, -- name = "charged arcanomancer sigil"
	{ id = 39186, chance = 600 }, -- name = "charged arboreal ring"
	{ id = 39180, chance = 600 }, -- name = "charged alicorn ring"
	{ id = 39177, chance = 600 }, -- name = "charged spiritthorn ring"
	{ name = "portable flame", chance = 600 },
	{ name = "firefighting axe", chance = 600 },
	{ id = 36728, chance = 1500 }, -- bestiary betterment
	{ id = 36729, chance = 1500 }, -- fire resilience
	{ id = 36730, chance = 1500 }, -- ice resilience
	{ id = 36731, chance = 1500 }, -- earth resilience
	{ id = 36732, chance = 1500 }, -- energy resilience
	{ id = 36733, chance = 1500 }, -- holy resilience
	{ id = 36734, chance = 1500 }, -- death resilience
	{ id = 36735, chance = 1500 }, -- physical resilience
	{ id = 22721, chance = 9000, maxCount = 15 }, -- gold token
	{ name = "white pearl", chance = 12500, maxCount = 35 },
	{ id = 43895, chance = 1000 }, -- bag you covet
	{ id = 23488, chance = 2000 }, -- grand sanguine box
	{ id = 14758, chance = 4000 },
	{ id = 12210, chance = 4000 },
	{ id = 25062, chance = 100000}, --pinata dragon
	{ name = "addon doll", chance = 3000 },
	{ name = "mount contract", chance = 3000 },
	{ name = "heart of phoenix", chance = 3000 },
	{ id = 4115, chance = 3000 },
}

monster.attacks = {
    { name = "melee", interval = 2000, chance = 100, skill = 250, attack = 5000 },
    { name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -4500, maxDamage = -9700, radius = 6, effect = CONST_ME_EXPLOSIONHIT, target = false },
    { name = "combat", interval = 3000, chance = 12, type = COMBAT_HOLYDAMAGE, minDamage = -4000, maxDamage = -9500, radius = 5, effect = CONST_ME_HOLYDAMAGE, target = false },
    { name = "combat", interval = 3500, chance = 10, type = COMBAT_HOLYDAMAGE, minDamage = -1500, maxDamage = -5000, range = 7, shootEffect = CONST_ANI_HOLY, effect = CONST_ME_HOLYDAMAGE, target = true },
    { name = "speed", interval = 4000, chance = 8, speedChange = -1000, radius = 6, effect = CONST_ME_MAGIC_RED, target = false, duration = 60000 },
    { name = "combat", interval = 2000, chance = 30, type = COMBAT_HOLYDAMAGE, minDamage = -200000, maxDamage = -200000, length = 8, spread = 0, shootEffect = CONST_ANI_HOLY, effect = CONST_ME_HOLYDAMAGE, target = false },
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