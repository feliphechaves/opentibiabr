-- bonus_outfits.lua
-- Bônus permanente baseado na quantidade de outfits com addon-3 que o personagem possui.

local outfits = dofile(CORE_DIRECTORY .. "/libs/tables/outfits.lua")

-----------------------------------------------------------------
-- Constantes compatíveis com a tua distro (mesmas da Soul Fire Relic)
-----------------------------------------------------------------
local STAT_ML = CONDITION_PARAM_STAT_MAGICPOINTS -- +magic level
local SKILL_DIST = CONDITION_PARAM_SKILL_DISTANCE -- +distance
local SKILL_MELEE = CONDITION_PARAM_SKILL_MELEE -- +melee total
local SKILL_FIST = CONDITION_PARAM_SKILL_FIST -- +fist (Monk)
local SKILL_SHIELD = CONDITION_PARAM_SKILL_SHIELD -- +shielding  (NOVO)

-----------------------------------------------------------------
-- Configuração
-----------------------------------------------------------------
local OUTFITS_POR_NIVEL = 5 -- a cada 5 outfits completos → +1
local MAX_BONUS = 1000 -- limite superior
local CONDITION_SUBID = 77 -- identificador exclusivo da condição

-----------------------------------------------------------------
-- Vocação base → quais atributos recebem o bônus principal
-----------------------------------------------------------------
local vocSkillMap = {
	[VOCATION.BASE_ID.SORCERER] = { STAT_ML },
	[VOCATION.BASE_ID.DRUID] = { STAT_ML },
	[VOCATION.BASE_ID.PALADIN] = { SKILL_DIST },
	[VOCATION.BASE_ID.KNIGHT] = { SKILL_MELEE },
	[VOCATION.BASE_ID.MONK] = { SKILL_FIST },
}

-----------------------------------------------------------------
-- Para mensagem amigável
-----------------------------------------------------------------
local paramName = {
	[STAT_ML] = "magic level",
	[SKILL_DIST] = "distance",
	[SKILL_MELEE] = "melee",
	[SKILL_FIST] = "fist",
	[SKILL_SHIELD] = "shielding",
}

-----------------------------------------------------------------
-- Evento de login
-----------------------------------------------------------------
local addBonus = CreatureEvent("AddonBonus")

function addBonus.onLogin(player)
	if not player:isVip() then
		return true -- só aplica se for premium
	end

	local male = player:getSex() == PLAYERSEX_MALE
	local fullAddons = 0

	-- 1. Conta os outfits completos (addon 3)
	for _, e in ipairs(outfits) do
		local looktype = male and e[1] or e[2]
		if player:hasOutfit(looktype, 3) then
			fullAddons = fullAddons + 1
		end
	end

	-- 2. Calcula o bônus
	local bonus = math.min(math.floor(fullAddons / OUTFITS_POR_NIVEL), MAX_BONUS)

	-- 3. Remove condição antiga (evita empilhar)
	player:removeCondition(CONDITION_ATTRIBUTES, CONDITIONID_DEFAULT, CONDITION_SUBID)

	if bonus < 1 then
		return true -- nada a aplicar
	end

	-- 4. Aplica a nova condição
	local params = vocSkillMap[player:getVocation():getBaseId()]
	if not params then
		return true
	end

	local cond = Condition(CONDITION_ATTRIBUTES, CONDITIONID_DEFAULT)
	cond:setParameter(CONDITION_PARAM_TICKS, -1) -- permanente
	cond:setParameter(CONDITION_PARAM_SUBID, CONDITION_SUBID)

	-- atributos principais
	for _, p in ipairs(params) do
		cond:setParameter(p, bonus)
	end
	-- bônus extra: shielding
	cond:setParameter(SKILL_SHIELD, bonus)

	player:addCondition(cond)

	-- 5. Feedback ao jogador
	local txt = {}
	for _, p in ipairs(params) do
		table.insert(txt, paramName[p] or "skill")
	end
	table.insert(txt, "shielding") -- mostra o extra na mensagem

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("Voce possui %d outfits completos e recebeu +%d em %s.", fullAddons, bonus, table.concat(txt, "/")))
	return true
end

addBonus:register()
