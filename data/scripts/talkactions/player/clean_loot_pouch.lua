local cleanLootPouch = TalkAction("!cleanlootpouch")

function cleanLootPouch.onSay(player, words, param)
	local LOOT_POUCH_ID = 23721 -- ID do item da Loot Pouch
	local lootPouch = nil

	-- Obtém a Store Inbox do jogador
	local storeInbox = player:getSlotItem(CONST_SLOT_STORE_INBOX)
	if not storeInbox then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your Store Inbox is not accessible.")
		return true
	end

	-- Itera pelos itens na Store Inbox para encontrar a Loot Pouch
	for i = 0, storeInbox:getSize() - 1 do
		local item = storeInbox:getItem(i)
		if item and item:getId() == LOOT_POUCH_ID then
			lootPouch = item -- Define a Loot Pouch como o item encontrado
			break
		end
	end

	if not lootPouch then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You do not have a Loot Pouch in your Store Inbox.")
		return true
	end

	-- Itera diretamente pelos itens na Loot Pouch e remove-os
	local itemsRemoved = 0
	for i = lootPouch:getSize() - 1, 0, -1 do
		local item = lootPouch:getItem(i)
		if item then
			itemsRemoved = itemsRemoved + 1
			item:remove()
		end
	end

	if itemsRemoved > 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your Loot Pouch was cleared! Total items removed: " .. itemsRemoved .. ".\n\nIf you still see items inside due to a visual bug, please close and reopen your Loot Pouch to update its content.")
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your Loot Pouch is already empty.\n\nIf you still see items inside due to a visual bug, please close and reopen your Loot Pouch to update its content.")
	end

	return true
end

cleanLootPouch:groupType("normal")
cleanLootPouch:register()
