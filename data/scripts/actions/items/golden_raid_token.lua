local usableItemMounts = Action()

function usableItemMounts.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not player:isVip() then
		player:sendCancelMessage("You need to be VIP.")
		return true
	end

    player:openForge()
	item:remove(1)

	return true
end

--golden raid token
usableItemMounts:id(19082)
usableItemMounts:register()
