function onSpeak(player, type, message)
	local playerGroupType = player:getGroup():getId()
	if player:getLevel() == 1 and playerGroupType < GROUP_TYPE_GAMEMASTER then
		player:sendCancelMessage("You may not speak into channels as long as you are on level 1.")
		return false
	end

	local hasExhaustion = player:kv():get("channel-worldchat-exhaustion") or 0
	if hasExhaustion > os.time() then
		player:sendCancelMessage("You are muted from the Help channel for using it inappropriately.")
		return false
	end

	if playerGroupType >= GROUP_TYPE_TUTOR then
		if string.sub(message, 1, 6) == "!mute " then
			local targetName = string.sub(message, 7)
			local target = Player(targetName)
			if target then
				if playerGroupType > target:getAccountType() then
					if not target:getCondition(CONDITION_CHANNELMUTEDTICKS, CONDITIONID_DEFAULT, CHANNEL_HELP) then
						target:addCondition(muted)
						target:kv():set("channel-worldchat-exhaustion", os.time() + 1800) -- 30 minutes
						sendChannelMessage(CHANNEL_HELP, TALKTYPE_CHANNEL_R1, target:getName() .. " has been muted by " .. player:getName() .. " for using World Chat Channel inappropriately.")
					else
						player:sendCancelMessage("That player is already muted.")
					end
				else
					player:sendCancelMessage("You are not authorized to mute that player.")
				end
			else
				player:sendCancelMessage(RETURNVALUE_PLAYERWITHTHISNAMEISNOTONLINE)
			end
			return false
		elseif string.sub(message, 1, 8) == "!unmute " then
			local targetName = string.sub(message, 9)
			local target = Player(targetName)
			if target then
				if playerGroupType > target:getAccountType() then
					local hasExhaustionTarget = target:kv():get("channel-worldchat-exhaustion") or 0
					if hasExhaustionTarget > os.time() then
						target:removeCondition(CONDITION_CHANNELMUTEDTICKS, CONDITIONID_DEFAULT, CHANNEL_HELP)
						sendChannelMessage(CHANNEL_HELP, TALKTYPE_CHANNEL_R1, target:getName() .. " has been unmuted.")
						target:kv():remove("channel-worldchat-exhaustion")
					else
						player:sendCancelMessage("That player is not muted.")
					end
				else
					player:sendCancelMessage("You are not authorized to unmute that player.")
				end
			else
				player:sendCancelMessage(RETURNVALUE_PLAYERWITHTHISNAMEISNOTONLINE)
			end
			return false
		end
	end

	-- GODs always speak in red
	if playerGroupType >= GROUP_TYPE_GAMEMASTER then
		return TALKTYPE_CHANNEL_R1
	end

	if type == TALKTYPE_CHANNEL_Y then
		if playerGroupType >= GROUP_TYPE_TUTOR then
			type = TALKTYPE_CHANNEL_O
		end
	elseif type == TALKTYPE_CHANNEL_O then
		if playerGroupType < GROUP_TYPE_TUTOR then
			type = TALKTYPE_CHANNEL_Y
		end
	elseif type == TALKTYPE_CHANNEL_R1 then
		if playerGroupType < GROUP_TYPE_GAMEMASTER and not player:hasFlag(PlayerFlag_CanTalkRedChannel) then
			type = TALKTYPE_CHANNEL_Y
		end
	end
	return type
end
