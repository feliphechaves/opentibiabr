local yielothaxKill = CreatureEvent("YielothaxDeath")
function yielothaxKill.onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustifie)
	local key = 673003
	local value = Game.getStorageValue(key)
	Game.setStorageValue(key, (value < 0 and 1 or value + 1))
	return true
end

yielothaxKill:register()
