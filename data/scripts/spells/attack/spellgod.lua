local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_EXPLOSIONAREA)
combat:setArea(createCombatArea(AREA_CIRCLE5X5))

-- Dano fixo
function onGetFormulaValues(player, level, maglevel)
	local min = -150000
	local max = -150000
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	-- Apenas God pode usar
	if creature:getGroup():getId() < 6 then
		creature:sendCancelMessage("Apenas o God pode usar essa magia.")
		creature:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end

	return combat:execute(creature, variant)
end

spell:group("attack", "focus")
spell:id(998) -- ID único
spell:name("God Blast")
spell:words("god blast")
spell:level(1)
spell:mana(0)
spell:isSelfTarget(true)
spell:isPremium(false)
spell:cooldown(0)
spell:groupCooldown(0)
spell:needLearn(false)
spell:vocation("sorcerer;true", "master sorcerer;true") -- apenas formalidade
spell:register()
