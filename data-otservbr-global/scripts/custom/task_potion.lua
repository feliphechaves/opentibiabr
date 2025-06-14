local taskPotion = Action()

-- Storage para controlar o buff de kills
local TASK_KILL_BONUS_STORAGE = 65003
local TASK_KILL_BONUS_EXPIRATION = 65004 -- Novo storage para guardar o timestamp de expiração

function taskPotion.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	-- Efeito visual ao usar a poção
	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)

	-- Adiciona o efeito de buff nas kills e guarda o timestamp de expiração
	player:setStorageValue(TASK_KILL_BONUS_STORAGE, 1)
	player:setStorageValue(TASK_KILL_BONUS_EXPIRATION, os.time() + 3600) -- 1 hora em segundos

	-- Mensagem de confirmação
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce agora recebera o dobro de progresso em suas tasks por 1 hora!")

	-- Remove a poção após o uso
	item:remove(1)

	return true
end

-- ID da poção (você pode alterar para o ID que desejar)
taskPotion:id(5802)
taskPotion:register()
