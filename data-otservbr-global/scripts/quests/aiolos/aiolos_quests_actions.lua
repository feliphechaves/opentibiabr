local aiolosBossQuestDeath = CreatureEvent("AiolosBossQuestDeath")

-- Mapeia os storages para cada boss
local bossStorages = {
	["Mega Beetle"] = 60535,
	["Primal Fire"] = 60536,
	["Executor of Aiolos"] = 60537
}

function aiolosBossQuestDeath.onDeath(creature, corpse, killer, mostDamageKiller)
	local bossName = creature:getName()
	local storage = bossStorages[bossName]

	if not storage then
		print("[Warning] Boss death event triggered for '" .. bossName .. "' but no storage is mapped.")
		return true
	end

	onDeathForDamagingPlayers(creature, function(creature, player)
		if player:isPlayer() then
			player:setStorageValue(storage, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You participated in the boss fight and may now access the reward room.")
		end
	end)

	return true
end

aiolosBossQuestDeath:register()
