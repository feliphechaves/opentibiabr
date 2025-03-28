local checkGlobal = TalkAction("/checkglobal")

function checkGlobal.onSay(player, words, param)
    -- create log
    logCommand(player, words, param)

    local key = tonumber(param)
    if not key then
        player:sendTextMessage(MESSAGE_STATUS, "Usage: /checkglobal <storageId>")
        return false
    end

    local value = Game.getStorageValue(key)
    player:sendTextMessage(MESSAGE_STATUS, "Global storage [" .. key .. "] = " .. value)
    return true
end

checkGlobal:separator(" ")
checkGlobal:groupType("god")
checkGlobal:register()