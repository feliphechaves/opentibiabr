local outfits, outfitsWithoutAddons = dofile(CORE_DIRECTORY .. "/libs/tables/outfits.lua")

local itemDollId = 51318
local randOutfit = Action()

function randOutfit.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local available = {}
	local isMale = player:getSex() == PLAYERSEX_MALE

	for _, outfit in ipairs(outfits) do
		local looktype = isMale and outfit[1] or outfit[2]
		local name = outfit[3]

		if outfitsWithoutAddons[name] then
			if not player:hasOutfit(looktype) then
				table.insert(available, { male = outfit[1], female = outfit[2], name = name, noAddons = true })
			end
		else
			if not player:hasOutfit(looktype, 3) then
				table.insert(available, { male = outfit[1], female = outfit[2], name = name })
			end
		end
	end

	if #available == 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You already have all outfits for your gender!")
		return true
	end

	local chosen = available[math.random(#available)]

	if chosen.noAddons then
		player:addOutfit(chosen.male)
		player:addOutfit(chosen.female)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You obtained the %s outfit!", chosen.name))
	else
		player:addOutfitAddon(chosen.male, 3)
		player:addOutfitAddon(chosen.female, 3)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You obtained the full %s outfit with all addons!", chosen.name))
	end

	player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
	item:remove(1)
	return true
end

randOutfit:id(itemDollId)
randOutfit:register()
