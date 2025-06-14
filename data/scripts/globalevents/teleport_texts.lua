local effects = {
	{ position = Position(32365, 32239, 7), text = "BOSS ROOM", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(32365, 32234, 7), text = "TRAINERS", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(32373, 32239, 7), text = "HUNTS", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(1237, 1019, 0), text = "NEXT FLOOR", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(1246, 1028, 1), text = "NEXT FLOOR", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(1246, 1004, 2), text = "NEXT FLOOR", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(1259, 999, 7), text = "NEXT FLOOR", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(1061, 1018, 7), text = "CLEAR SHOPPING BAGS", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(1248, 995, 9), text = "MON", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(1249, 995, 9), text = "TUE", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(1251, 995, 9), text = "WED SAT", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(1253, 995, 9), text = "THU SUN", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(1254, 995, 9), text = "FRI", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(1062, 1027, 7), text = "TASK", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(1064, 1027, 7), text = "BOSS TASK", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(32373, 32233, 7), text = "FREE CASINO", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(32373, 32235, 7), text = "PREMIUM CASINO", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(1236, 1019, 0), text = "LAST FLOOR", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(1245, 994, 11), text = "FIRST FLOOR", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(32373, 32237, 7), text = "SOUL PIT", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(1066, 923, 7), text = "INQUISITION", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(1059, 926, 7), text = "ANNIHILATOR", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(1063, 922, 7), text = "POI", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(1060, 923, 7), text = "DEMON HELMET", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(1067, 926, 7), text = "BAG YOU DESIRE", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(1066, 929, 7), text = "PRIMAL BAG", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(1060, 929, 7), text = "BAG YOU COVET", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(32365, 32236, 7), text = "QUESTS", effect = CONST_ME_GROUNDSHAKER },
}

local animatedText = GlobalEvent("AnimatedText")
function animatedText.onThink(interval)
	for i = 1, #effects do
		local settings = effects[i]
		local spectators = Game.getSpectators(settings.position, false, true, 7, 7, 5, 5)
		if #spectators > 0 then
			if settings.text then
				for i = 1, #spectators do
					spectators[i]:say(settings.text, TALKTYPE_MONSTER_SAY, false, spectators[i], settings.position)
				end
			end
			if settings.effect then
				settings.position:sendMagicEffect(settings.effect)
			end
		end
	end
	return true
end

animatedText:interval(4550)
animatedText:register()
