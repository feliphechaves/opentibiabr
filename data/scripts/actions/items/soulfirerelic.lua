local relicItemId = 37749
local activatedItemId = 37750
local cooldownStorage = 92001
local duration = 60 * 60 * 1000 -- 1 hora
local cooldown = 1 * 60 * 60 + 5 -- 1 horas (em segundos)
local goldCost = 50000000 -- 50kk

local action = Action()

function action.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local now = os.time()
	local lastUse = player:getStorageValue(cooldownStorage)

	if lastUse > now then
		local remaining = lastUse - now
		player:sendCancelMessage("The relic is recharging. Please wait " .. math.ceil(remaining / 60) .. " minutes.")
		return true
	end

	if not player:removeMoney(goldCost) then
		player:sendCancelMessage("You need 50kk gold to activate this item.")
		return true
	end

	-- Definir novo cooldown
	player:setStorageValue(cooldownStorage, now + cooldown)

	-- Buff por vocação
	local condition = Condition(CONDITION_ATTRIBUTES)
	condition:setParameter(CONDITION_PARAM_TICKS, duration)
	condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

	local baseVoc = player:getVocation():getBaseId()
	if baseVoc == VOCATION.BASE_ID.KNIGHT then
		condition:setParameter(CONDITION_PARAM_SKILL_MELEE, 15)
	elseif baseVoc == VOCATION.BASE_ID.PALADIN then
		condition:setParameter(CONDITION_PARAM_SKILL_DISTANCE, 15)
	elseif baseVoc == VOCATION.BASE_ID.SORCERER or baseVoc == VOCATION.BASE_ID.DRUID then
		condition:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 15)
	else
		condition:setParameter(CONDITION_PARAM_SKILL_MELEE, 15)
		condition:setParameter(CONDITION_PARAM_SKILL_DISTANCE, 15)
		condition:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 15)
	end
	condition:setParameter(CONDITION_PARAM_SKILL_CRITICAL_HIT_CHANCE, 500)

	player:addCondition(condition)

	-- Efeito e fala
	player:say("You summon the flames of the soulfire!", TALKTYPE_MONSTER_SAY)
	player:getPosition():sendMagicEffect(CONST_ME_FIREAREA)
	player:getPosition():sendMagicEffect(CONST_ME_HITBYFIRE)

	-- Trocar para sprite flamejante
	if item:getId() == relicItemId then
		item:transform(activatedItemId)
		-- Agendar retorno para sprite original após 1h
		addEvent(function()
			local slotItem = player:getItemById(activatedItemId, true)
			if slotItem then
				slotItem:transform(relicItemId)
				player:sendTextMessage(MESSAGE_FAILURE, "The relic has lost its fiery energy.")
			end
		end, duration)
	end

	return true
end

action:id(relicItemId)
action:register()