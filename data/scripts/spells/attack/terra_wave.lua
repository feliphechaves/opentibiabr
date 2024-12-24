local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_SMALLPLANTS)
combat:setArea(createCombatArea(AREA_SQUAREWAVE5, AREADIAGONAL_SQUAREWAVE5))
local spell = Spell("instant")

local function adjustValues(min, max)
	return min * 2, max * 2
end

function spell.onCastSpell(creature, var)
local weapon = creature:getSlotItem(CONST_SLOT_LEFT)
if weapon and weapon:getId() == 43885 then -- CHECK SANGUINE ROD
	function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 4.5)
	local max = (level / 5) + (maglevel * 8)
	return adjustValues(-min, -max)
	end
elseif weapon and weapon:getId() == 43886 then -- CHECK GRAND SANGUINE ROD
	function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 6)
	local max = (level / 5) + (maglevel * 9)
	return adjustValues(-min, -max)
	end
else 
	function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 3.5)
	local max = (level / 5) + (maglevel * 7)
	return adjustValues(-min, -max)
	end
end
	combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
	-- CHECK SANGUINE GALOSHES
	local boots = creature:getSlotItem(CONST_SLOT_FEET)
	if boots and boots:getId() == 43887 then
		creature:setSkillLevel(8, creature:getSkillLevel(8) + 800)
		combat:execute(creature, var)
		creature:setSkillLevel(8, creature:getSkillLevel(8) - 800)
		else
			combat:execute(creature, var)
		end
	return true
end

spell:group("attack")
spell:id(120)
spell:name("Terra Wave")
spell:words("exevo tera hur")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_TERRA_WAVE)
spell:level(38)
spell:mana(170)
spell:isPremium(true)
spell:needDirection(true)
spell:cooldown(4 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("druid;true", "elder druid;true")
spell:register()
