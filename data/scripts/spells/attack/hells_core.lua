local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
combat:setArea(createCombatArea(AREA_CIRCLE5X5))

local spell = Spell("instant")

local function adjustValues(min, max)
	return min * 2, max * 2
end

function spell.onCastSpell(creature, variant)
	local weapon = creature:getSlotItem(CONST_SLOT_LEFT)
	-- CHECK SANGUINE COIL
	if weapon and weapon:getId() == 43882 then
		function onGetFormulaValues(player, level, maglevel)
			local min = (level / 5) + (maglevel * 12)
			local max = (level / 5) + (maglevel * 15)
			return adjustValues(-min, -max)
		end
	-- CHECK GRAND SANGUINE COIL
	elseif weapon and weapon:getId() == 43883 then
		function onGetFormulaValues(player, level, maglevel)
			local min = (level / 5) + (maglevel * 14)
			local max = (level / 5) + (maglevel * 16)
			return adjustValues(-min, -max)
		end
	else
		function onGetFormulaValues(player, level, maglevel)
			local min = (level / 5) + (maglevel * 10)
			local max = (level / 5) + (maglevel * 14)
			return adjustValues(-min, -max)
		end
	end
	combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
	-- CHECK SANGUINE BOOTS
	local boots = creature:getSlotItem(CONST_SLOT_FEET)
	if boots and boots:getId() == 43884 then
		creature:setSkillLevel(8, creature:getSkillLevel(8) + 800)
		combat:execute(creature, variant)
		creature:setSkillLevel(8, creature:getSkillLevel(8) - 800)
	else
		combat:execute(creature, variant)
	end
	return true
end

spell:group("attack", "focus")
spell:id(24)
spell:name("Hell's Core")
spell:words("exevo gran mas flam")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_HELL_SCORE)
spell:level(60)
spell:mana(1100)
spell:isSelfTarget(true)
spell:isPremium(true)
spell:cooldown(40 * 1000)
spell:groupCooldown(4 * 1000, 40 * 1000)
spell:needLearn(false)
spell:vocation("sorcerer;true", "master sorcerer;true")
spell:register()
