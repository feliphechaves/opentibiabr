local config = {
    itemId = 44048,
    mountId = 217,
    requiredItemCount = 4
}

local usableSpiritOfPurityItems = Action()

function usableSpiritOfPurityItems.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Verificar se o jogador já possui a montaria
    if player:hasMount(config.mountId) then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You already have this mount!")
        return true
    end

    -- Verificar se o jogador tem a quantidade necessária de itens
    if player:getItemCount(config.itemId) < config.requiredItemCount then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You still need more items to complete the requirements!")
        return true
    end

    -- Remover a quantidade necessária de itens do inventário do jogador
    if player:removeItem(config.itemId, config.requiredItemCount) then
        -- Conceder a montaria e o achievement
        player:addMount(config.mountId)
        player:addAchievement("The Spirit of Purity")
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Spirit of Purity is now yours!")
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "An error occurred while removing the items.")
    end

    return true
end

usableSpiritOfPurityItems:id(config.itemId)
usableSpiritOfPurityItems:register()