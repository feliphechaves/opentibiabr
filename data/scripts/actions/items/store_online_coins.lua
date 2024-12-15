local storeOnlineCoin = Action()

function storeOnlineCoin.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local count = item:getCount()
	player:addTibiaCoins(count)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have added " .. count .. " tibia coins to your balance. Your total is now " .. player:getTibiaCoins() .. ".")
	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
	item:remove()

	return true
end

storeOnlineCoin:id(22723)
storeOnlineCoin:register()
