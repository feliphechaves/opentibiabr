local royalFanfareSummon = Action()

local itemId = 2956 -- ID do item que ativa a venda
local npcName = "Fanfare Merchant" -- Nome do NPC responsável pela venda
local removalTime = 5 * 60 * 1000 -- 5 minutos em milissegundos
local cooldownStorage = 12345 -- Identificador único para o cooldown no armazenamento do jogador
local cooldownTime = 5 * 60 -- Cooldown em segundos

-- Função para encontrar uma posição livre ao redor do jogador
local function findFreePositionAround(position)
	local directions = {
		{ x = 1, y = 0 }, -- Direita
		{ x = -1, y = 0 }, -- Esquerda
		{ x = 0, y = 1 }, -- Abaixo
		{ x = 0, y = -1 }, -- Acima
		{ x = 1, y = 1 }, -- Diagonal Inferior Direita
		{ x = 1, y = -1 }, -- Diagonal Superior Direita
		{ x = -1, y = 1 }, -- Diagonal Inferior Esquerda
		{ x = -1, y = -1 }, -- Diagonal Superior Esquerda
	}

	for _, dir in ipairs(directions) do
		local newPos = Position(position.x + dir.x, position.y + dir.y, position.z)
		local tile = Tile(newPos)
		if tile and not tile:hasProperty(CONST_PROP_IMMOVABLEBLOCKSOLID) then
			return newPos
		end
	end
	return nil -- Não encontrou posição livre
end

function royalFanfareSummon.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local currentTime = os.time()
	local lastUseTime = player:getStorageValue(cooldownStorage)

	-- Verifica o cooldown
	if lastUseTime > 0 and currentTime < (lastUseTime + cooldownTime) then
		local remainingTime = math.ceil((lastUseTime + cooldownTime - currentTime) / 60)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You must wait %d more minutes to use this item again.", remainingTime))
		return false
	end

	-- Atualiza o tempo de uso
	player:setStorageValue(cooldownStorage, currentTime)

	local playerPosition = player:getPosition()
	local freePosition = findFreePositionAround(playerPosition)

	if not freePosition then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "There is no free space around you to summon the Fanfare Merchant.")
		return false
	end

	local npc = Game.createNpc(npcName, freePosition)
	if not npc then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Failed to summon the Fanfare Merchant.")
		return false
	end

	item:getPosition():sendMagicEffect(CONST_ME_SOUND_GREEN)
	freePosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
	player:getPosition():sendSingleSoundEffect(SOUND_EFFECT_TYPE_BIRD_BARK, player:isInGhostMode() and nil or player)

	return true
end

royalFanfareSummon:id(itemId)
royalFanfareSummon:register()
