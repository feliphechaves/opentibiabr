-- phoenix_mounts.lua
-- Item para dar uma montaria Phoenix aleatória

-----------------------------------------------------------------
-- IDs dos itens
-----------------------------------------------------------------
local ITEM_PHOENIX_MOUNT = 65021

-----------------------------------------------------------------
-- IDs das montarias Phoenix
-----------------------------------------------------------------
local PHOENIX_MOUNTS = {
	{ id = 245, name = "Corpse Phoenix" },
	{ id = 246, name = "Death Phoenix" },
	{ id = 247, name = "Soul Phoenix" },
}

-----------------------------------------------------------------
-- Função para usar o item
-----------------------------------------------------------------
local function usePhoenixMount(player, item, fromPosition, target, toPosition, isHotkey)
	-- Lista de montarias que o jogador ainda não tem
	local availableMounts = {}

	-- Verifica quais montarias o jogador ainda não tem
	for _, mount in ipairs(PHOENIX_MOUNTS) do
		if not player:hasMount(mount.id) then
			table.insert(availableMounts, mount)
		end
	end

	-- Se o jogador já tem todas as montarias
	if #availableMounts == 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce ja possui todas as montarias Phoenix!")
		return true
	end

	-- Escolhe uma montaria aleatória das disponíveis
	local randomMount = availableMounts[math.random(1, #availableMounts)]

	-- Adiciona a montaria
	player:addMount(randomMount.id)
	item:remove(1)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce recebeu a montaria " .. randomMount.name .. "!")
	return true
end

-----------------------------------------------------------------
-- Registro do item
-----------------------------------------------------------------
local phoenixMount = Action()
function phoenixMount.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	return usePhoenixMount(player, item, fromPosition, target, toPosition, isHotkey)
end
phoenixMount:id(ITEM_PHOENIX_MOUNT)
phoenixMount:register()
