local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
combat:setArea(createCombatArea(AREA_CIRCLE5X5))

local spell = Spell("instant")

local function adjustValues(min, max)
	return min * 2, max * 2
end

function spell.onCastSpell(creature, var)
	local weapon = creature:getSlotItem(CONST_SLOT_LEFT)
	if weapon and weapon:getId() == 43885 then -- CHECK SANGUINE ROD
		function onGetFormulaValues(player, level, maglevel)
			local min = (level / 5) + (maglevel * 8)
			local max = (level / 5) + (maglevel * 13)
			return adjustValues(-min, -max)
		end
	elseif weapon and weapon:getId() == 43886 then -- CHECK GRAND SANGUINE ROD
		function onGetFormulaValues(player, level, maglevel)
			local min = (level / 5) + (maglevel * 10)
			local max = (level / 5) + (maglevel * 14)
			return adjustValues(-min, -max)
		end
	else
		function onGetFormulaValues(player, level, maglevel)
			local min = (level / 5) + (maglevel * 6)
			local max = (level / 5) + (maglevel * 12)
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

spell:group("attack", "focus")
spell:id(118)
spell:name("Eternal Winter")
spell:words("exevo gran mas frigo")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_ETERNAL_WINTER)
spell:level(60)
spell:mana(1050)
spell:isPremium(true)
spell:range(5)
spell:isSelfTarget(true)
spell:cooldown(40 * 1000)
spell:groupCooldown(4 * 1000, 40 * 1000)
spell:needLearn(false)
spell:vocation("druid;true", "elder druid;true")
spell:register()
