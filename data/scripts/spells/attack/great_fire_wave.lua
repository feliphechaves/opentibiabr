local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITBYFIRE)

local area = createCombatArea(AREA_WAVE7, AREADIAGONAL_WAVE7)
combat:setArea(area)

local spell = Spell("instant")

local function adjustValues(min, max)
	return min * 2, max * 2
end

function spell.onCastSpell(creature, var)
local weapon = creature:getSlotItem(CONST_SLOT_LEFT)
	if weapon and weapon:getId() == 43882 then -- CHECK SANGUINE COIL
		function onGetFormulaValues(player, level, maglevel)
		local min = (level / 5) + (maglevel * 3.5) + 26
		local max = (level / 5) + (maglevel * 4.8) + 38
		return adjustValues(-min, -max)
		end
	elseif weapon and weapon:getId() == 43883 then -- CHECK GRAND SANGUINE COIL
		function onGetFormulaValues(player, level, maglevel)
		local min = (level / 5) + (maglevel * 4.1) + 36
		local max = (level / 5) + (maglevel * 5.3) + 48
		return adjustValues(-min, -max)
		end
	else 
		function onGetFormulaValues(player, level, maglevel)
		local min = (level / 5) + (maglevel * 2.8) + 16
		local max = (level / 5) + (maglevel * 4.4) + 28
		return adjustValues(-min, -max)
		end
	end
		combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
		-- CHECK SANGUINE BOOTS
		local boots = creature:getSlotItem(CONST_SLOT_FEET)
		if boots and boots:getId() == 43884 then
			creature:setSkillLevel(8, creature:getSkillLevel(8) + 800)
			combat:execute(creature, var)
			creature:setSkillLevel(8, creature:getSkillLevel(8) - 800)
			else
				combat:execute(creature, var)
			end
		return true
end

spell:group("attack")
spell:id(240)
spell:name("Great Fire Wave")
spell:words("exevo gran flam hur")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_GREAT_FIRE_WAVE)
spell:level(38)
spell:mana(120)
spell:isPremium(true)
spell:needDirection(true)
spell:cooldown(4 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("sorcerer;true", "master sorcerer;true")
spell:register()
