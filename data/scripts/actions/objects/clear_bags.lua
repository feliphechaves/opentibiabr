local emptybps = Action()
local playerDelay = {}

function emptybps.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not playerDelay[player:getId()] then
		playerDelay[player:getId()] = true

		local toRemove = {}
		local removed = false

		for _, itemZ in ipairs(player:getSlotItem(CONST_SLOT_BACKPACK):getItems(true)) do
			if itemZ:getId() == ITEM_SHOPPING_BAG and itemZ:getEmptySlots() == 20 then
				toRemove[itemZ] = itemZ
			end
		end

		-- Check for the exaltation chest in the main backpack
		for _, itemZ in ipairs(player:getSlotItem(CONST_SLOT_BACKPACK):getItems(true)) do
			if itemZ:getId() == 37561 and itemZ:getEmptySlots() == 2 then
				toRemove[itemZ] = itemZ
			end
		end

		for k, v in pairs(toRemove) do
			v:remove()
			removed = true
		end

		if removed then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You cleaned your empty main shopping bags and empty exaltation chests.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have no shopping bags or exaltation chests in your main backpack.")
		end

		if item:getId() == 39511 then
			item:transform(39512)
		else
			item:transform(39511)
		end

		player:getPosition():sendMagicEffect(CONST_ME_GROUNDSHAKER)

		addEvent(function(pid)
			playerDelay[pid] = false
		end, 2000, player:getId())
	end
	return true
end

emptybps:aid(26914)
emptybps:register()
