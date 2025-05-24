local relicItemId = 37749
local activatedItemId = 37750
local cooldownStorage = 92001
local buffEndStorage = 92002
local duration = 15 --60 * 60 -- 1 hora em segundos
local cooldown = 15 --60 * 60 -- 1 hora em segundos
local goldCost = 1 -- 50kk

local action = Action()

function action.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local now = os.time()
	local lastUse = player:getStorageValue(cooldownStorage)
	local buffEndsAt = player:getStorageValue(buffEndStorage)

	-- Verifica se o item está ativado, mas o tempo acabou, então reverte
	if item:getId() == activatedItemId and (buffEndsAt <= 0 or now >= buffEndsAt) then
		item:transform(relicItemId)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The relic has lost its fiery energy.")
		return true
	end

	-- Verifica cooldown
	if lastUse > now then
		local remaining = lastUse - now
		player:sendCancelMessage("The relic is recharging. Please wait " .. math.ceil(remaining / 60) .. " minutes.")
		return true
	end

	-- Verifica dinheiro
	if not player:removeMoney(goldCost) then
		player:sendCancelMessage("You need 50kk gold to activate this item.")
		return true
	end

	-- Definir novo cooldown e fim do buff
	player:setStorageValue(cooldownStorage, now + cooldown)
	player:setStorageValue(buffEndStorage, now + duration)

	-- Buff por vocação
	local condition = Condition(CONDITION_ATTRIBUTES)
	condition:setParameter(CONDITION_PARAM_TICKS, duration * 1000)
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

	-- Trocar sprite para ativado
	if item:getId() == relicItemId then
		item:transform(activatedItemId)

		-- Agendar retorno visual após a duração (não depende da lógica de buff)
		addEvent(function()
			local slotItem = player:getItemById(activatedItemId, true)
			if slotItem then
				slotItem:transform(relicItemId)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The relic has lost its fiery energy.")
			end
		end, duration * 1000)
	end

	return true
end

action:id(relicItemId)
action:id(activatedItemId) -- permite reverter quando o jogador tenta usar de novo
action:register()