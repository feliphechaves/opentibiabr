local royalFanfare = Action()

function royalFanfare.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	-- Lista de possíveis itens a serem criados (com chances iguais)
	local possibleItems = {3296, 37607, 3395, 37608}

	-- Escolhe aleatoriamente um dos itens
	local randomIndex = math.random(1, #possibleItems)
	local newItemId = possibleItems[randomIndex]

	-- Tiers com pesos (quanto maior o peso, mais comum)
	local tierChances = {
		[1] = 50, -- 50%
		[2] = 25, -- 25%
		[3] = 15, -- 15%
		[4] = 7,  -- 7%
		[5] = 3   -- 3%
	}

	-- Sorteia o tier com base nos pesos
	local totalChance = 0
	for _, chance in pairs(tierChances) do
		totalChance = totalChance + chance
	end

	local roll = math.random(1, totalChance)
	local accumulated = 0
	local tier = 1
	for t, chance in ipairs(tierChances) do
		accumulated = accumulated + chance
		if roll <= accumulated then
			tier = t
			break
		end
	end

	player:addItem(newItemId, 1, true, 0, CONST_SLOT_WHEREEVER, tier)

	item:remove(1)

	player:sendTextMessage(MESSAGE_STATUS, "Congratulations! You received a [" .. ItemType(newItemId):getName() .. "] (Tier " .. tier .. ")!")

	return true
end

royalFanfare:id(25062)
royalFanfare:register()