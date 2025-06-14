local eyeembroideredveil = Action()

function eyeembroideredveil.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local outfitId = player:getSex() == PLAYERSEX_FEMALE and 1387 or 1386
	if player:hasOutfit(outfitId, 1) then
		player:sendCancelMessage("You already have this addon.")
		return true
	end

	player:addOutfitAddon(1386, 1) -- male
	player:addOutfitAddon(1387, 1) -- female
	player:getPosition():sendMagicEffect(CONST_ME_POFF)
	player:say("You gained a new outfit addon.", TALKTYPE_MONSTER_SAY, false, player)
	item:remove()
	return true
end

eyeembroideredveil:id(37003)
eyeembroideredveil:register()

local tagraltinlaidscabbard = Action()

function tagraltinlaidscabbard.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local outfitId = player:getSex() == PLAYERSEX_FEMALE and 1387 or 1386
	if player:hasOutfit(outfitId, 2) then
		player:sendCancelMessage("You already have this addon.")
		return true
	end

	player:addOutfitAddon(1386, 2) -- male
	player:addOutfitAddon(1387, 2) -- female
	player:getPosition():sendMagicEffect(CONST_ME_POFF)
	player:say("You gained a new outfit addon.", TALKTYPE_MONSTER_SAY, false, player)
	item:remove()
	return true
end

tagraltinlaidscabbard:id(37002)
tagraltinlaidscabbard:register()
