local monsters = {
	{ cosmicNormal = "cosmic energy prism a", cosmicInvu = "cosmic energy prism a invu", pos = Position(32801, 32827, 14) },
	{ cosmicNormal = "cosmic energy prism b", cosmicInvu = "cosmic energy prism b invu", pos = Position(32798, 32827, 14) },
	{ cosmicNormal = "cosmic energy prism c", cosmicInvu = "cosmic energy prism c invu", pos = Position(32803, 32826, 14) },
	{ cosmicNormal = "cosmic energy prism d", cosmicInvu = "cosmic energy prism d invu", pos = Position(32796, 32826, 14) },
}

local function revertLloyd(prismId)
	local lloydTile = Tile(Position(32799, 32826, 14))
	if lloydTile then
		local lloyd = lloydTile:getTopCreature()
		if lloyd then
			lloyd:teleportTo(Position(32799, 32829, 14))
			lloyd:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		end
	end

	local tile = Tile(monsters[prismId].pos)
	if tile then
		local creatures = tile:getCreatures()
		for _, creature in ipairs(creatures) do
			if creature:isMonster() then
				creature:remove()
			end
		end
		Game.createMonster(monsters[prismId].cosmicInvu, Position(monsters[prismId].pos), true, true)
	end
end

local lloydPrepareDeath = CreatureEvent("LloydPrepareDeath")
function lloydPrepareDeath.onPrepareDeath(creature, lastHitKiller, mostDamageKiller)
	local prismCount = 1
	for m = 1, #monsters do
		local tile = Tile(monsters[m].pos)
		if tile then
			local cosmic = tile:getTopCreature()
			if not cosmic then
				prismCount = prismCount + 1
			end
		end
	end

	local reborn = false
	if prismCount <= 4 then
		local tile = Tile(monsters[prismCount].pos)
		if tile then
			local creature = tile:getTopCreature()
			if creature then
				creature:remove()
			end
			Game.createMonster(monsters[prismCount].cosmicNormal, Position(monsters[prismCount].pos), true, true)
			reborn = true
		end
	end

	if reborn then
		creature:teleportTo(Position(32799, 32826, 14))
		creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		creature:addHealth(300000, true)
		creature:say("The cosmic energies in the chamber refocus on Lloyd.", TALKTYPE_MONSTER_SAY)
		Storage.Quest.U11_02.ForgottenKnowledge.LloydEvent = addEvent(revertLloyd, 10 * 1000, prismCount)
	end
	return true
end

lloydPrepareDeath:register()
