local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREATTACK)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)

local function adjustValues(min, max)
	return min * 2, max * 2
end

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 1.81) + 10
	local max = (level / 5) + (maglevel * 3) + 18
	return adjustValues(-min, -max)
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local rune = Spell("rune")

function rune.onCastSpell(creature, var, isHotkey)
	return combat:execute(creature, var)
end

rune:id(15)
rune:group("attack")
rune:name("fireball rune")
rune:castSound(SOUND_EFFECT_TYPE_SPELL_OR_RUNE)
rune:impactSound(SOUND_EFFECT_TYPE_SPELL_FIREBALL_RUNE)
rune:runeId(3189)
rune:allowFarUse(true)
rune:charges(5)
rune:level(27)
rune:magicLevel(4)
rune:cooldown(2 * 1000)
rune:groupCooldown(2 * 1000)
rune:needTarget(true)
rune:isBlocking(true) -- True = Solid / False = Creature
rune:register()
