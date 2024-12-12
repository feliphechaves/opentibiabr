local effects = {
	{ position = Position(32365, 32239, 7), text = "BOSS ROOM", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(32365, 32234, 7), text = "TRAINERS", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(32373, 32234, 7), text = "VIP", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(32373, 32239, 7), text = "HUNTS", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(1237, 1019, 0), text = "NEXT FLOOR", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(1246, 1028, 1), text = "NEXT FLOOR", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(1246, 1004, 2), text = "NEXT FLOOR", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(1259, 999, 7), text = "NEXT FLOOR", effect = CONST_ME_GROUNDSHAKER },

	{ position = Position(1248, 995, 9), text = "MON", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(1249, 995, 9), text = "TUE", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(1251, 995, 9), text = "WED SAT", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(1253, 995, 9), text = "THU SUN", effect = CONST_ME_GROUNDSHAKER },
	{ position = Position(1254, 995, 9), text = "FRI", effect = CONST_ME_GROUNDSHAKER },
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
