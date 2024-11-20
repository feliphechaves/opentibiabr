local summonElderBloodJaw = CreatureEvent("SummonElderBloodJaw")
function summonElderBloodJaw.onThink(creature)

	local bossName = creature:getName():lower()
	if not table.contains({ "murcion", "chagorz", "ichgahal", "vemiath" }, bossName) then
		return false
	end

	local hp = ( creature:getHealth() / creature:getMaxHealth() ) * 100
	local bossPosition = creature:getPosition()
	local checkSummon = creature:getStorageValue(78990) == 1

	if hp < 80 and not checkSummon then
		creature:setStorageValue(78990,1)
		creature:say("The END is near!!!", TALKTYPE_MONSTER_SAY)
		Game.createMonster("Elder Bloodjaw", bossPosition)
		Game.createMonster("Elder Bloodjaw", bossPosition)
		Game.createMonster("Elder Bloodjaw", bossPosition)
		Game.createMonster("Elder Bloodjaw", bossPosition)
		if bossName == "chagorz" then
			Game.createMonster("Converter", bossPosition)
			Game.createMonster("Converter", bossPosition)
			Game.createMonster("Converter", bossPosition)
		end
		if bossName == "vemiath" then
			Game.createMonster("Darklight Source", bossPosition)
			Game.createMonster("Walking Pillar", bossPosition)
			Game.createMonster("Darklight Matter", bossPosition)
		end
		if bossName == "bakragore" then
			Game.createMonster("Elder Bloodjaw", bossPosition)
			Game.createMonster("Elder Bloodjaw", bossPosition)
			Game.createMonster("Elder Bloodjaw", bossPosition)
			Game.createMonster("Elder Bloodjaw", bossPosition)
			Game.createMonster("Elder Bloodjaw", bossPosition)
		end
	end

	return true
end

summonElderBloodJaw:register()
