local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)

local function adjustValues(min, max, percentIncrease)
	-- Adiciona a porcentagem de dano ao valor base
	return min * (1 + percentIncrease / 100), max * (1 + percentIncrease / 100)
end

-- Tabela contendo os IDs das armas válidas
local validWeapons = {
	[47370] = true, --amber bludgeon
	[47376] = true, --amber cudgel
	[47369] = true, --amber greataxe
	[47375] = true, --amber axe
	[47368] = true, --amber slayer
	[47374] = true, --amber sabre
}

function onGetFormulaValues(player, skill, attack, factor)
	local skillTotal = skill * attack
	local levelTotal = player:getLevel() / 5

	-- Calcula o dano base
	local min = -(((skillTotal * 0.17) + 13) + levelTotal) * 1.28
	local max = -(((skillTotal * 0.20) + 34) + levelTotal) * 1.28

	-- Verifica se o item equipado na mão direita está na lista de armas válidas
	local weapon = player:getSlotItem(CONST_SLOT_RIGHT)
	if weapon and validWeapons[weapon:getId()] then
		return adjustValues(min, max, 4)
	else
		return min, max
	end
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack")
spell:id(62)
spell:name("Annihilation")
spell:words("exori gran ico")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_OR_RUNE)
spell:impactSound(SOUND_EFFECT_TYPE_SPELL_ANNIHILATION)
spell:level(110)
spell:mana(300)
spell:isPremium(true)
spell:range(1)
spell:needTarget(true)
spell:blockWalls(true)
spell:needWeapon(true)
spell:cooldown(30 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("knight;true", "elite knight;true")
spell:register()
