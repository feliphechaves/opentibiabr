local silverToken = Action()

function silverToken.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local cost = 20000000;
	if player:isVip() then
		cost = cost * 0.8
	end

	if player:getMoney() + player:getBankBalance() < cost then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You do not have 20,000,000 golds!", dustAmount, player:getName()))
		return false
	end

	local dustAmount = 130

	-- Check dust level
	local finalDustAmount = player:getForgeDusts() + dustAmount
	if finalDustAmount > player:getForgeDustLevel() then
		dustAmount = player:getForgeDustLevel() - player:getForgeDusts()
	end

	if dustAmount <= 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You have the maximum amount of dust!", dustAmount, player:getName()))
		return false
	end

	player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
	player:addForgeDusts(dustAmount)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("Successful added 130 dusts!", dustAmount, player:getName()))
	item:remove(1)
	player:removeMoneyBank(cost)

	return true
end

--silver token
silverToken:id(22516)
silverToken:register()
