local relicItemId = 22889
local activatedItemId = 22890
local cooldownStorage = 92003
local buffEndStorage = 92004
local duration = 60 * 60 -- 1 hora
local cooldown = 60 * 60 -- 1 hora
local goldCost = 50000000 -- 50kk

local action = Action()

function action.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local now = os.time()
	local lastUse = player:getStorageValue(cooldownStorage)
	local buffEndsAt = tonumber(player:getStorageValue(buffEndStorage)) or 0

	if item:getId() == activatedItemId and (buffEndsAt <= 0 or now >= buffEndsAt) then
		item:transform(relicItemId)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A aura protetora da reliquia se dissipou.")
		return true
	end

	if lastUse > now then
		local remaining = lastUse - now
		player:sendCancelMessage("A reliquia está recarregando. Aguarde " .. math.ceil(remaining / 60) .. " minutos.")
		return true
	end

	if not player:removeMoney(goldCost) then
		player:sendCancelMessage("Voce precisa de 50kk de gold para ativar este item.")
		return true
	end

	player:setStorageValue(cooldownStorage, now + cooldown)
	player:setStorageValue(buffEndStorage, now + duration)

	local condition = Condition(CONDITION_ATTRIBUTES)
	condition:setParameter(CONDITION_PARAM_SUBID, 10001)
	condition:setParameter(CONDITION_PARAM_TICKS, duration * 1000)
	condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
	condition:setParameter(CONDITION_PARAM_SKILL_SHIELD, 15)
	condition:setParameter(CONDITION_PARAM_ABSORB_PHYSICALPERCENT, 10)
	condition:setParameter(CONDITION_PARAM_ABSORB_FIREPERCENT, 10)
	condition:setParameter(CONDITION_PARAM_ABSORB_ICEPERCENT, 10)
	condition:setParameter(CONDITION_PARAM_ABSORB_ENERGYPERCENT, 10)
	condition:setParameter(CONDITION_PARAM_ABSORB_EARTHPERCENT, 10)
	condition:setParameter(CONDITION_PARAM_ABSORB_DEATHPERCENT, 10)
	condition:setParameter(CONDITION_PARAM_ABSORB_HOLYPERCENT, 10)
	
	player:addCondition(condition)

	player:say("Voce invoca a protecao da reliquia guardia!", TALKTYPE_MONSTER_SAY)
	player:getPosition():sendMagicEffect(CONST_ME_GIANTICE)

	if item:getId() == relicItemId then
		item:transform(activatedItemId)

		addEvent(function()
			local slotItem = player:getItemById(activatedItemId, true)
			if slotItem then
				player:removeCondition(CONDITION_ATTRIBUTES, CONDITIONID_DEFAULT, 10001)
				-- Criar uma condição leve só pra forçar o update do client
				local updateCond = Condition(CONDITION_ATTRIBUTES)
				updateCond:setParameter(CONDITION_PARAM_TICKS, 100) -- duração curtíssima (100ms)
				updateCond:setParameter(CONDITION_PARAM_SUBID, 99999)
				updateCond:setParameter(CONDITION_PARAM_SKILL_FIST, 1) -- não muda nada, mas força refresh
				player:addCondition(updateCond)
				slotItem:transform(relicItemId)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A aura protetora da reliquia se dissipou.")
			end
		end, duration * 1000)
	end

	return true
end

action:id(relicItemId)
action:id(activatedItemId)
action:register()