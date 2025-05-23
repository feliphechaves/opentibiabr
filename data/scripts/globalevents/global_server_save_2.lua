local function ServerSave()
	logger.info("GlobalServerSave 4")

	if configManager.getBoolean(configKeys.GLOBAL_SERVER_SAVE_CLEAN_MAP) then
		cleanMap()
	end

	if configManager.getBoolean(configKeys.GLOBAL_SERVER_SAVE_CLOSE) then
		Game.setGameState(GAME_STATE_CLOSED)
	end
	if configManager.getBoolean(configKeys.GLOBAL_SERVER_SAVE_SHUTDOWN) then
		Game.setGameState(GAME_STATE_SHUTDOWN)
	end

	-- Update daily reward next server save timestamp
	--UpdateDailyRewardGlobalStorage(DailyReward.storages.lastServerSave, os.time())
end

local function ServerSaveWarning(time)
	-- Calculate remaining time, minus one minute

	logger.info("GlobalServerSave 3")

	local remainingTime = tonumber(time) - 60000
	if configManager.getBoolean(configKeys.GLOBAL_SERVER_SAVE_NOTIFY_MESSAGE) then
		local message = "Server is saving the game in " .. (remainingTime / 60000) .. " minute(s). Please logout."
		Webhook.sendMessage("Server save", message, WEBHOOK_COLOR_WARNING)
		Game.broadcastMessage(message, MESSAGE_GAME_HIGHLIGHT)
	end

	if remainingTime > 60000 then
		addEvent(ServerSaveWarning, 60000, remainingTime)
	else
		addEvent(ServerSave, 60000)
	end
end

local globalServerSave2 = GlobalEvent("GlobalServerSave2")

-- Function that is called by the global events when it reaches the time configured
-- Interval is the time between the event start and the effective save, it will send a notify message every minute
function globalServerSave2.onTime(interval)
	logger.info("GlobalServerSave 1")
	local remainingTime = configManager.getNumber(configKeys.GLOBAL_SERVER_SAVE_NOTIFY_DURATION) * 60000
	if configManager.getBoolean(configKeys.GLOBAL_SERVER_SAVE_NOTIFY_MESSAGE) then
		local message = "Server is saving the game in " .. (remainingTime / 60000) .. " minute(s). Please logout."
		Webhook.sendMessage("Server save", message, WEBHOOK_COLOR_WARNING)
		Game.broadcastMessage(message, MESSAGE_GAME_HIGHLIGHT)
	end
	logger.info("GlobalServerSave 2")
	-- Schedule the next warning event in 1 minute (60000 milliseconds)
	addEvent(ServerSaveWarning, 60000, remainingTime)
	return not configManager.getBoolean(configKeys.GLOBAL_SERVER_SAVE_SHUTDOWN)
end

--globalServerSave2:time("12:00:00")
--globalServerSave2:register()
