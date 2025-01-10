local charmToken = Action()

function charmToken.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local charmPoints = 500 -- Quantidade de Charm Points a ser adicionada

    -- Adiciona Charm Points ao jogador
    player:addCharmPoints(charmPoints)

    -- Feedback ao jogador
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You have received %d Charm Points!", charmPoints))

    -- Remove o item após o uso
    item:remove(1)

    return true
end

-- Configurar o ID do item que adiciona Charm Points
charmToken:id(12210) -- Substitua pelo ID do item desejado
charmToken:register()
