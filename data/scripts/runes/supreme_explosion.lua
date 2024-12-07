local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_EXPLOSIONAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EXPLOSION)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setArea(createCombatArea(AREA_CIRCLE1X1))

function onGetFormulaValues(player, level, maglevel)
	local min = 0
	local max = (level / 5) + (maglevel * 4.8)
	return -min * 2.6, -max * 2.6
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local rune = Spell("rune")

function rune.onCastSpell(creature, var, isHotkey)
	return combat:execute(creature, var)
end

rune:id(1018)
rune:group("attack")
rune:name("supreme explosion rune")
rune:castSound(SOUND_EFFECT_TYPE_SPELL_OR_RUNE)
rune:impactSound(SOUND_EFFECT_TYPE_SPELL_EXPLOSION_RUNE)
rune:runeId(11607)
rune:vocation("sorcerer;true", "master sorcerer;true", "druid;true", "elder druid;true")
rune:allowFarUse(true)
rune:charges(6)
rune:level(1500)
rune:magicLevel(6)
rune:cooldown(2 * 1000)
rune:groupCooldown(2 * 1000)
rune:isBlocking(true) -- True = Solid / False = Creature
rune:register()
