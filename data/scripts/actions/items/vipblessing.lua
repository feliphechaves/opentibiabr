local VIP_BLESS_STORAGE = 51200
local BLESS_COST = 1
local TOKEN_ID = 22721 -- ID of the Gold Token (or any other item you want to use)
local ITEM_ID = 2851

local vipBlessingItem = Action()

function vipBlessingItem.onUse(player, item, ...)
	if not player:isVip() then
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are not Vip!")
		return true
	end

	if player:getStorageValue(VIP_BLESS_STORAGE) == 1 then
		player:sendTextMessage(MESSAGE_FAILURE, "You are already protected by the Vip Blessing.")
		return true
	end

	player:removeItem(ITEM_ID, 1)
	player:setStorageValue(VIP_BLESS_STORAGE, 1)
	player:sendTextMessage(MESSAGE_FAILURE, "You are now protected by the Vip Blessing! You won't lose level on death (one-time use).")
	player:getPosition():sendMagicEffect(CONST_ME_HOLYDAMAGE)
	return true
end

vipBlessingItem:id(ITEM_ID)
vipBlessingItem:register()
