local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)
combat:setArea(createCombatArea(AREA_SQUARE1X1))

local spell = Spell("instant")

local function adjustValues(min, max)
	return min * 2, max * 2
end

function spell.onCastSpell(creature, variant)
	-- CHECK SANGUINE MELEE WEAPONS
--local sanguineWeapon = {43864, 43866, 43868, 43870, 43872, 43874 }--this didnt work, however will leave tables here
--local grandSanguineWeapon = {43865, 43867, 43869, 43871, 43873, 43875}

local weapon = creature:getSlotItem(CONST_SLOT_LEFT)
if weapon and weapon:getId() == 43864 or weapon and weapon:getId() == 43866 or weapon and weapon:getId() == 43868 or weapon and weapon:getId() == 43870 or weapon and weapon:getId() == 43872 or weapon and weapon:getId() == 43874 then
--creature:sendCancelMessage("Sanguine Weapon.") -- this was just for test
function onGetFormulaValues(player, skill, attack, factor)
	local level = player:getLevel()
	local min = (level / 5) + (skill + 2 * attack) * 1.5
	local max = (level / 5) + (skill + 2 * attack) * 3.15
	return adjustValues(-min * 1.1, -max * 1.1)
end
-- CHECK GRAND SANGUINE MELEE WEAPONS
elseif weapon and weapon:getId() == 43865 or weapon and weapon:getId() == 43867 or weapon and weapon:getId() == 43869 or weapon and weapon:getId() == 43871 or weapon and weapon:getId() == 43873 or weapon and weapon:getId() == 43875 then
function onGetFormulaValues(player, skill, attack, factor)
	local level = player:getLevel()
	local min = (level / 5) + (skill + 3 * attack) * 1.85
	local max = (level / 5) + (skill + 3 * attack) * 3.4
	return adjustValues(-min * 1.1, -max * 1.1)
end
else 
function onGetFormulaValues(player, skill, attack, factor)
	local level = player:getLevel()
	local min = (level / 5) + (skill + 2 * attack) * 1.1
	local max = (level / 5) + (skill + 2 * attack) * 3
	return adjustValues(-min * 1.1, -max * 1.1) -- TODO : Use New Real Formula instead of an %
end
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
	-- CHECK SANGUINE LEGS
local legs = creature:getSlotItem(CONST_SLOT_LEGS)
	if legs and legs:getId() == 43876 then
		creature:setSkillLevel(8, creature:getSkillLevel(8) + 800)
		combat:execute(creature, variant)
		creature:setSkillLevel(8, creature:getSkillLevel(8) - 800)
		else
			combat:execute(creature, variant)
		end
	return true
end

spell:group("attack")
spell:id(105)
spell:name("Fierce Berserk")
spell:words("exori gran")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_FIERCE_BERSERK)
spell:level(90)
spell:mana(340)
spell:isPremium(true)
spell:needWeapon(true)
spell:cooldown(6 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("knight;true", "elite knight;true")
spell:register()
