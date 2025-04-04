local lotteryTicket = Action()

function lotteryTicket.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if math.random(5) == 1 then -- 20% de chance
		player:getPosition():sendMagicEffect(CONST_ME_SOUND_YELLOW)
		item:transform(5958)
	else
		item:getPosition():sendMagicEffect(CONST_ME_POFF)
		item:remove(1)
	end
	return true
end

lotteryTicket:id(5957)
lotteryTicket:register()