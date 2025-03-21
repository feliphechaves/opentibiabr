local royalFanfare = Action()

local itemId = 2956 -- ID do item que ativa a venda
local cooldownStorage = 12345 -- Identificador único para o cooldown no armazenamento do jogador
local cooldownTime = 30 -- Cooldown em segundos
local ITEM_GOLD_POUCH = 23721

function getLootPouchContainer(player)
	for _, inboxItem in pairs(player:getStoreInbox():getItems()) do
		if inboxItem:getId() == ITEM_GOLD_POUCH then
			return Container(inboxItem:getUniqueId())
		end
	end
	return nil
end

local function sellLootPouchItems(player)
	local currentTime = os.time()
	local lastUseTime = player:getStorageValue(cooldownStorage)

	-- Verifica o cooldown
	if lastUseTime > 0 and currentTime < (lastUseTime + cooldownTime) then
		local remainingTime = math.ceil((lastUseTime + cooldownTime - currentTime) / 60)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You must wait %d more minutes to use this item again.", remainingTime))
		return true
	end

	local lootPouch = getLootPouchContainer(player)
	if not lootPouch then
		player:sendCancelMessage("You do not have a Loot Pouch!")
		return true
	end

	local totalGold = 0
	for i = lootPouch:getSize() - 1, 0, -1 do
		local item = lootPouch:getItem(i)
		if item then
			local itemName = item:getName():lower()
			local itemData = nil

			-- Busca exata do nome no LootShopConfigTable (em vez de usar string.starts)
			for _, lootItem in ipairs(LootShopConfig) do
				if lootItem.itemName:lower() == itemName then
					itemData = lootItem
					break
				end
			end

			if itemData then
				--logger.info("itemName = " .. itemData.itemName .. " Item vendido: " .. item:getName() .. " Preço unitário: " .. itemData.sell .. " Quantidade: " .. item:getCount() .. " Total: " .. itemData.sell * item:getCount())
				totalGold = totalGold + (itemData.sell * item:getCount())
				item:remove()
				--else
				--logger.info("Item não encontrado na tabela de vendas:" .. item:getName())
			end
		end
	end

	if totalGold > 0 then
		player:setBankBalance(player:getBankBalance() + totalGold)
		player:sendTextMessage(MESSAGE_LOOK, "You sold all items of your Loot Pouch for " .. totalGold .. " gold coins.")
		player:setStorageValue(cooldownStorage, currentTime)
	else
		player:sendCancelMessage("No valid items to sell in your Loot Pouch.")
	end

	return true
end

function royalFanfare.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	return sellLootPouchItems(player)
end

royalFanfare:id(itemId)
royalFanfare:register()
