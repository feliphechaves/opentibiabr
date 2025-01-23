local config = {
	requiredItems = {
		[34072] = { key = "spectral-horseshoes", count = 4 },
		[34073] = { key = "spectral-saddle", count = 1 },
		[34074] = { key = "spectral-horse-tac", count = 1 },
	},

	mountId = 167,
}

local usablePhantasmalJadeItems = Action()

function usablePhantasmalJadeItems.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local itemInfo = config.requiredItems[item:getId()]
	if not itemInfo then
		return true
	end

	-- Verificar se o jogador já possui a montaria
	if player:hasMount(config.mountId) then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You already have this mount!")
		return true
	end

	-- Verificar se o item atual é necessário para completar os requisitos
	local currentCount = (player:kv():get(itemInfo.key) or 0) + 1
	if currentCount <= itemInfo.count then
		player:kv():set(itemInfo.key, currentCount)
		player:getPosition():sendMagicEffect(CONST_ME_HOLYDAMAGE)
		item:remove(1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You have collected %d/%d %s.", currentCount, itemInfo.count, item:getName()))
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You already have enough of this item.")
		return true
	end

	-- Verificar se o jogador já completou os requisitos de todos os itens
	for _, info in pairs(config.requiredItems) do
		if (player:kv():get(info.key) or 0) < info.count then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You still need more items to complete the requirements.")
			return true
		end
	end

	-- Todos os itens foram coletados, conceder a montaria e achievements
	player:addMount(config.mountId)
	player:addAchievement("Natural Born Cowboy")
	player:addAchievement("You got Horse Power")
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Phantasmal jade is now yours!")
	return true
end

for itemId, _ in pairs(config.requiredItems) do
	usablePhantasmalJadeItems:id(itemId)
end

usablePhantasmalJadeItems:register()