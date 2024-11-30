local usableItemMounts = Action()

function usableItemMounts.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:openForge()
	if not player:isVip() then
		item:remove(1)
	end
	return true
end

--golden raid token
usableItemMounts:id(19082)
usableItemMounts:register()
