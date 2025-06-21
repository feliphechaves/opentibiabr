local deathFirstDragon = CreatureEvent("FirstDragonDeath")

local destinations = {
	Position(33616, 31020, 13),
	Position(33617, 31020, 13),
	Position(33618, 31020, 13),
	Position(33616, 31021, 13),
	Position(33617, 31021, 13),
	Position(33618, 31021, 13),
	Position(33616, 31022, 13),
	Position(33617, 31022, 13),
	Position(33618, 31022, 13),
	Position(33616, 31023, 13),
	Position(33617, 31023, 13),
	Position(33618, 31023, 13),
	Position(33616, 31024, 13),
	Position(33617, 31024, 13),
	Position(33618, 31024, 13),
}

function deathFirstDragon.onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
	onDeathForDamagingPlayers(creature, function(creature, player)
		player:teleportTo(Position(33617, 31020, 13))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		if player:getStorageValue(Storage.Quest.U11_02.TheFirstDragon.Feathers) < 1 then
			player:setStorageValue(Storage.Quest.U11_02.TheFirstDragon.Feathers, 1)
		end
		-- Entrega do Festive Outfit
		if not player:hasOutfit(929) and not player:hasOutfit(931) then
			player:addOutfit(929, 0)
			player:addOutfit(931, 0)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations! You received the Festive Outfit.")
			player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
		end
	end)
	return true
end

deathFirstDragon:register()
