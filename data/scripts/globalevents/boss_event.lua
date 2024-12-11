local config = {
    teleportId = 27658,
    eventDate = "2024-12-15", -- Data específica no formato YYYY-MM-DD
    eventTime = "20:01:00", -- Hora específica no formato HH:MM:SS
    bossPosition = Position(32124, 32687, 4),
    bossName = 'Ferumbras',
    teleportPosition = Position(32369, 32236, 7),
    destinationPosition = Position(32121, 32707, 7),
    tolerance = 60 -- Tolerância em segundos
}

local function executeEvent()
    local item = Game.createItem(config.teleportId, 1, config.teleportPosition)
    if item then
        if not item:isTeleport() then
            item:remove()
            return
        end
        item:setDestination(config.destinationPosition)
    end
    addEvent(function()
        Game.createMonster(config.bossName, config.bossPosition, false, true)
		Game.broadcastMessage(config.bossName .. 'spawned! Go to Thais temple and use the teleport to destroy him', MESSAGE_GAME_HIGHLIGHT)
    end, 5000)
end

local function isEventTime()
    local currentTimestamp = os.time()
    local eventTimestamp = os.time{
        year = tonumber(config.eventDate:sub(1, 4)),
        month = tonumber(config.eventDate:sub(6, 7)),
        day = tonumber(config.eventDate:sub(9, 10)),
        hour = tonumber(config.eventTime:sub(1, 2)),
        min = tonumber(config.eventTime:sub(4, 5)),
        sec = tonumber(config.eventTime:sub(7, 8))
    }
	
    local timeDifference = math.abs(eventTimestamp - currentTimestamp)
    return timeDifference <= config.tolerance
end

local function startEventCheck()
    if isEventTime() then
        executeEvent()
    else
        -- Reagendar a checagem após 10 segundos
        addEvent(startEventCheck, 10000) -- 10 segundos
    end
end

-- Inicia a verificação imediatamente ao carregar o script
addEvent(startEventCheck, 1000) -- 1 segundo após o startup
