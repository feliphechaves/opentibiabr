-- Usage talkaction: "!tasklog on" or "!tasklog off"
local tasklog = TalkAction("!tasklog")

function tasklog.onSay(player, words, param)
	local STORAGEVALUE_TASKLOG = 189999

	if param == "" then
		player:sendCancelMessage("Please specify the parameter: 'on' to activate or 'off' to deactivate.")
		return true
	end

	if param == "on" then
		player:setStorageValue(STORAGEVALUE_TASKLOG, 0)
		player:sendTextMessage(MESSAGE_LOOK, "You have activated task log messages.")
	elseif param == "off" then
		player:setStorageValue(STORAGEVALUE_TASKLOG, 1)
		player:sendTextMessage(MESSAGE_LOOK, "You have deactivated task log messages.")
	end
	return true
end

tasklog:separator(" ")
tasklog:groupType("normal")
tasklog:register()
