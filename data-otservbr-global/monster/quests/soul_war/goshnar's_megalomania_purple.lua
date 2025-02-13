local mType = Game.createMonsterType("Goshnar's Megalomania Purple")
local monster = {}

monster.name = "Goshnar's Megalomania"
monster.description = "Goshnar's Megalomania"
monster.experience = 0
monster.outfit = {
	lookType = 1308,
}

monster.health = 620000
monster.maxHealth = 620000
monster.race = "undead"
monster.corpse = 6028
monster.speed = 250
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 80,
	health = 10,
	damage = 10,
}

monster.events = {
	--"GoshnarsHatredBuff",
	"MegalomaniaDeath",
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
	staticAttackChance = 80,
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

monster.bosstiary = {
	bossRaceId = 1969,
	bossRace = RARITY_NEMESIS,
}

monster.loot = {
	{ name = "crystal coin", chance = 55000, minCount = 70, maxCount = 75 },
	{ id = 281, chance = 1150 }, -- giant shimmering pearl (green)
	{ name = "giant sapphire", chance = 10000, maxCount = 1 },
	{ name = "giant topaz", chance = 10000, maxCount = 1 },
	{ name = "violet gem", chance = 6000, maxCount = 1 },
	{ name = "blue gem", chance = 10000, maxCount = 3 },
	{ id = 3039, chance = 10000, maxCount = 3 }, -- red gem
	{ name = "green gem", chance = 10000, maxCount = 3 },
	{ name = "yellow gem", chance = 10000, maxCount = 3 },
	{ name = "white gem", chance = 6000, maxCount = 3 },
	{ name = "dragon figurine", chance = 10000, maxCount = 1 },
	{ name = "bullseye potion", chance = 15000, minCount = 10, maxCount = 25 },
	{ name = "mastermind potion", chance = 15000, minCount = 10, maxCount = 25 },
	{ name = "berserk potion", chance = 15000, minCount = 10, maxCount = 25 },
	{ name = "ultimate mana potion", chance = 18000, minCount = 50, maxCount = 100 },
	{ name = "supreme health potion", chance = 18000, minCount = 50, maxCount = 100 },
	{ name = "ultimate spirit potion", chance = 18000, minCount = 50, maxCount = 100 },
	{ name = "figurine of malice", chance = 400 },
	{ name = "figurine of cruelty", chance = 400 },
	{ name = "figurine of hatred", chance = 400 },
	{ name = "figurine of greed", chance = 400 },
	{ name = "figurine of spite", chance = 400 },
	{ name = "figurine of megalomania", chance = 400 },
	{ name = "megalomania's skull", chance = 400 },
	{ name = "megalomania's essence", chance = 400 },
	{ name = "bag you desire", chance = 100 },
	{ name = "gold token", minCount = 0, maxCount = 3, chance = 5000 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -800, maxDamage = -2500 },
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_DEATHDAMAGE, minDamage = -1550, maxDamage = -2620, length = 8, spread = 0, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_DEATHDAMAGE, minDamage = -1550, maxDamage = -2620, length = 8, spread = 0, effect = CONST_ME_BLACK_BLOOD, target = false },
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_DEATHDAMAGE, minDamage = -1050, maxDamage = -2020, length = 8, spread = 3, effect = CONST_ME_GHOST_SMOKE, target = false },
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_DEATHDAMAGE, minDamage = -1050, maxDamage = -2020, length = 8, spread = 3, effect = CONST_ME_SMALLCLOUDS, target = false },
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_DEATHDAMAGE, minDamage = -950, maxDamage = -1400, radius = 3, effect = CONST_ME_MORTAREA, target = true },
	{ name = "soulwars fear", interval = 35000, chance = 100, target = true },
	{ name = "megalomania transform elemental", interval = SoulWarQuest.goshnarsCrueltyWaveInterval * 1000, chance = 50 },
	{ name = "combat", interval = 30000, chance = 100, type = COMBAT_LIFEDRAIN, minDamage = -1000, maxDamage = -1500, length = 8, radius = 5, spread = 0, effect = CONST_ME_PINK_ENERGY_SPARK, target = true },
}

monster.defenses = {
	defense = 25,
	armor = 25,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 50 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 50 },
	{ type = COMBAT_EARTHDAMAGE, percent = 50 },
	{ type = COMBAT_FIREDAMAGE, percent = 50 },
	{ type = COMBAT_LIFEDRAIN, percent = 50 },
	{ type = COMBAT_MANADRAIN, percent = 50 },
	{ type = COMBAT_DROWNDAMAGE, percent = 50 },
	{ type = COMBAT_ICEDAMAGE, percent = 50 },
	{ type = COMBAT_HOLYDAMAGE, percent = 50 },
	{ type = COMBAT_DEATHDAMAGE, percent = 50 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType.onSpawn = function(monster)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end

	if SoulWarQuest.changeBlueEvent then
		stopEvent(SoulWarQuest.changeBlueEvent)
	end
	if SoulWarQuest.changePurpleEvent then
		stopEvent(SoulWarQuest.changePurpleEvent)
	end

	local bossKV = monster:getSoulWarKV()
	bossKV:set("aspect-of-power-death-count", 0)
	monster:resetHatredDamageMultiplier()
end

local intervalBetweenExecutions = 10000

local zone = Zone.getByName("boss.goshnar's-megalomania-purple")
local zonePositions = zone:getPositions()

mType.onThink = function(monsterCallback, interval)
	monsterCallback:onThinkGoshnarTormentCounter(interval, 36, intervalBetweenExecutions, SoulWarQuest.levers.goshnarsMegalomania.boss.position)
	monsterCallback:onThinkMegalomaniaWhiteTiles(interval, zonePositions, 8000)
	monsterCallback:goshnarsDefenseIncrease("cleansed-sanity-action")
end

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType:register(monster)
