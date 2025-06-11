local config = {
	boss = {
		name = "Scarlett Etzel",
		position = Position(33396, 32643, 6)
	},
	playerPositions = {
		{ pos = Position(33395, 32661, 6), teleport = Position(33396, 32651, 6) },
		{ pos = Position(33394, 32662, 6), teleport = Position(33396, 32651, 6) },
		{ pos = Position(33396, 32662, 6), teleport = Position(33396, 32651, 6) },
		{ pos = Position(33395, 32662, 6), teleport = Position(33396, 32651, 6) },
		{ pos = Position(33395, 32663, 6), teleport = Position(33396, 32651, 6) },
	},
	specPos = {
		from = Position(33385, 32638, 6),
		to = Position(33406, 32660, 6),
	},
	exit = Position(33395, 32665, 6),
}

local lever = BossLever(config)
lever:position(Position(33395, 32660, 6))
lever:register()

local graveScarlettAid = Action()

local metalWallId = 31449
function graveScarlettAid.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if item.itemid == metalWallId then
		if player:getPosition().y == 32666 then
			player:teleportTo(Position(33395, 32668, 6))
		else
			player:teleportTo(Position(33395, 32666, 6))
		end
	end

	return true
end

graveScarlettAid:aid(40003)
graveScarlettAid:register()
