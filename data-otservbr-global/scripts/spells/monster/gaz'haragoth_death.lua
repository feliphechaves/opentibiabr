local vocation = {
	VOCATION.BASE_ID.SORCERER,
	VOCATION.BASE_ID.DRUID,
	VOCATION.BASE_ID.PALADIN,
	VOCATION.BASE_ID.KNIGHT,
}

local area = {
	{ 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0 },
	{ 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0 },
	{ 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0 },
	{ 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0 },
	{ 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0 },
	{ 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0 },
	{ 1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 1 },
	{ 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0 },
	{ 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0 },
	{ 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0 },
	{ 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0 },
	{ 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0 },
	{ 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0 },
}

local createArea = createCombatArea(area)

local combat = Combat()
combat:setArea(createArea)

function onTargetTile(creature, pos)
	local creatureTable = {}
	local n, i = Tile({ x = pos.x, y = pos.y, z = pos.z }).creatures, 1
	if n ~= 0 then
		local v = getThingfromPos({ x = pos.x, y = pos.y, z = pos.z, stackpos = i }).uid
		while v ~= 0 do
			local creatureFromPos = Creature(v)
			if creatureFromPos then
				table.insert(creatureTable, v)
				if n == #creatureTable then
					break
				end
			end
			i = i + 1
			v = getThingfromPos({ x = pos.x, y = pos.y, z = pos.z, stackpos = i }).uid
		end
	end
	if #creatureTable ~= nil and #creatureTable > 0 then
		local min = 60000
		local max = 80000
		for r = 1, #creatureTable do
			if creatureTable[r] ~= creature then
				local creatureInTable = Creature(creatureTable[r])
				if creatureInTable then
					if creatureInTable:isPlayer() and table.contains(vocation, creatureInTable:getVocation():getBaseId()) then
						doTargetCombatHealth(creature, creatureTable[r], COMBAT_ENERGYDAMAGE, -min, -max, CONST_ME_NONE)
					elseif creatureInTable:isMonster() then
						doTargetCombatHealth(creature, creatureTable[r], COMBAT_ENERGYDAMAGE, -min, -max, CONST_ME_NONE)
					end
				end
			end
		end
	end
	pos:sendMagicEffect(CONST_ME_PURPLEENERGY)
	return true
end

combat:setCallback(CALLBACK_PARAM_TARGETTILE, "onTargetTile")

local function delayedCastSpell(cid, var)
	local creature = Creature(cid)
	if not creature then
		return
	end
	creature:say("Gaz'haragoth calls down: DEATH AND DOOM!", TALKTYPE_MONSTER_YELL)
	return combat:execute(creature, positionToVariant(creature:getPosition()))
end

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	creature:say("Gaz'haragoth begins to channel DEATH AND DOOM into the area! RUN!", TALKTYPE_MONSTER_YELL)
	addEvent(delayedCastSpell, 5000, creature:getId(), var)
	return true
end

spell:name("gaz'haragoth death")
spell:words("###325")
spell:isAggressive(true)
spell:blockWalls(true)
spell:needLearn(true)
spell:register()
