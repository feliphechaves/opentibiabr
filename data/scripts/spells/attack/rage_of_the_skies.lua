local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_BIGCLOUDS)
combat:setArea(createCombatArea(AREA_CIRCLE6X6))

local function adjustValues(min, max)
	return min * 2, max * 2
end

function onGetFormulaValues(player, level, maglevel)
    -- Verifica o item no slot da mão esquerda
    local weapon = player:getSlotItem(CONST_SLOT_LEFT)

    local min, max
    if weapon and weapon:getId() == 47372 then
        -- Ajusta a fórmula se o item estiver equipado
        min = ((level / 5) + (maglevel * 9))
        max = ((level / 5) + (maglevel * 16))
    else
        -- Fórmula padrão
        min = ((level / 5) + (maglevel * 7))
        max = ((level / 5) + (maglevel * 14))
    end

    return adjustValues(-min, -max)
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
    return combat:execute(creature, var)
end

spell:group("attack", "focus")
spell:id(119)
spell:name("Rage of the Skies")
spell:words("exevo gran mas vis")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_RAGE_OF_THE_SKIES)
spell:level(55)
spell:mana(600)
spell:isSelfTarget(true)
spell:isPremium(true)
spell:cooldown(25 * 1000)
--spell:groupCooldown(4 * 1000, 40 * 1000)
spell:needLearn(false)
spell:vocation("sorcerer;true", "master sorcerer;true")
spell:register()