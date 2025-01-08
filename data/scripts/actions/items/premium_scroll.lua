local premiumScroll = Action()

function premiumScroll.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local maxDays = 365
	if player:getPremiumDays() <= maxDays then
		item:remove(1)
		player:addPremiumDays(1)
		player:onAddVip(amount)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have activated your 1 day vip time, relog to make it effective.")
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
		player:sendCancelMessage("You can not buy more than " .. maxDays .. " days of vip account.")
	end
	return true
end

premiumScroll:id(14758)
premiumScroll:register()
