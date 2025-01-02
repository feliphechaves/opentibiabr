local fullStaminaRefill = Action()
function fullStaminaRefill.onUse(player, item, ...)
    local stamina = player:getStamina()
    if stamina >= 2520 then
        player:sendCancelMessage("You have a full stamina.")
        return true
    end
    player:setStamina(2520)
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
    player:sendCancelMessage("You have regenerate all your stamina.")
    item:remove(1)
    return true
end

fullStaminaRefill:id(11685)
fullStaminaRefill:register()