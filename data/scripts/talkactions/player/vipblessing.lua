local VIP_BLESS_STORAGE = 51200
local BLESS_COST = 1
local TOKEN_ID = 22721 -- ID of the Gold Token (or any other item you want to use)

local vipBlessing = TalkAction("!vipblessing")

function vipBlessing.onSay(player, words, param)
	if player:getStorageValue(VIP_BLESS_STORAGE) == 1 then
		player:sendTextMessage(MESSAGE_FAILURE, "You are already protected by the Vip Blessing.")
		return true
	end

	if player:getItemCount(TOKEN_ID) < BLESS_COST then
		player:sendTextMessage(MESSAGE_FAILURE, "You need " .. BLESS_COST .. " Gold Token to purchase the Vip Blessing.")
		return true
	end

	player:removeItem(TOKEN_ID, BLESS_COST)
	player:setStorageValue(VIP_BLESS_STORAGE, 1)
	player:sendTextMessage(MESSAGE_FAILURE, "You are now protected by the Vip Blessing! You won't lose level on death (one-time use).")
	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
	return true
end

--vipBlessing:groupType("normal")
--vipBlessing:register()

local checkVipBlessing = TalkAction("!checkvipblessing")

function checkVipBlessing.onSay(player, words, param)
	if player:getStorageValue(VIP_BLESS_STORAGE) == 1 then
		player:sendTextMessage(MESSAGE_FAILURE, "You are protected by the Vip Blessing.")
	else
		player:sendTextMessage(MESSAGE_FAILURE, "You are NOT protected by the Vip Blessing.")
	end
	return true
end

checkVipBlessing:groupType("normal")
checkVipBlessing:register()