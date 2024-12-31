local fps = TalkAction("!fps")

-- Definindo o storage para cooldown
local FPS_COOLDOWN_STORAGE = 100001 -- Use um storage único para evitar conflitos com outros scripts
local COOLDOWN_TIME = 60 -- Tempo em segundos

function fps.onSay(player, words, param)
    local currentTime = os.time()
    local lastUsedTime = player:getStorageValue(FPS_COOLDOWN_STORAGE)

    -- Verifica se o comando está em cooldown
    if lastUsedTime > 0 and currentTime < lastUsedTime + COOLDOWN_TIME then
        local timeLeft = (lastUsedTime + COOLDOWN_TIME) - currentTime
        player:sendTextMessage(MESSAGE_FAILURE, "You need to wait " .. timeLeft .. " seconds to use this command again.")
        return true
    end

    -- Atualiza o storage com o tempo atual
    player:setStorageValue(FPS_COOLDOWN_STORAGE, currentTime)

    -- Executa a lógica do comando
    if player then
        player:remove()
    end

    return true
end

fps:separator(" ")
fps:groupType("normal")
fps:register()
