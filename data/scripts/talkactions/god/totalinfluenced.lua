local save = TalkAction("/ti")

function save.onSay(player, words, param)
	local totalMonsters = 0
	for _, cid in pairs(Game.getInfluencedMonsters()) do
		if Monster(cid) then
			totalMonsters = totalMonsters + 1
		end
	end

	player:sendTextMessage(MESSAGE_ADMINISTRATOR, totalMonsters)
	-- create log
	logCommand(player, words, param)

	return true
end

save:separator(" ")
save:groupType("god")
save:register()
