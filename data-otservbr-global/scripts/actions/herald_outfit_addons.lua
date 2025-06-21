local HERALD_WINGS_ID = 44754
local HERALD_INSIGNIA_ID = 44753
local DRACCOON_HERALD_MALE = 1722
local DRACCOON_HERALD_FEMALE = 1723

local function getDraccoonOutfitId(player)
    return player:getSex() == PLAYERSEX_FEMALE and DRACCOON_HERALD_FEMALE or DRACCOON_HERALD_MALE
end

local function giveAddon(player, addon)
    local outfitId = getDraccoonOutfitId(player)
    if not player:hasOutfit(outfitId, addon) then
        player:addOutfitAddon(outfitId, addon)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations! You received addon " .. addon .. " of the Draccoon Herald outfit.")
        player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
        return true
    else
        player:sendCancelMessage("You already have this addon.")
        return false
    end
end

local heraldWings = Action()
function heraldWings.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if giveAddon(player, 1) then
        item:remove(1)
    end
    return true
end
heraldWings:id(HERALD_WINGS_ID)
heraldWings:register()

local heraldInsignia = Action()
function heraldInsignia.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if giveAddon(player, 2) then
        item:remove(1)
    end
    return true
end
heraldInsignia:id(HERALD_INSIGNIA_ID)
heraldInsignia:register() 