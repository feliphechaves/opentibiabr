local config = {
	teleportId = 34111,
	days = {
		["Monday"] = {
			bossName = "Aries",
			bossPosition = Position(1185, 989, 6),
			teleportPosition = Position(32369, 32234, 7),
			destinationPosition = Position(1143, 988, 6),
		},
		["Tuesday"] = {
			bossName = "Aries",
			bossPosition = Position(1185, 989, 6),
			teleportPosition = Position(32369, 32234, 7),
			destinationPosition = Position(1143, 988, 6),
		},
		["Wednesday"] = {
			bossName = "Aries",
			bossPosition = Position(1185, 989, 6),
			teleportPosition = Position(32369, 32234, 7),
			destinationPosition = Position(1143, 988, 6),
		},
		["Thursday"] = {
			bossName = "Aries",
			bossPosition = Position(1185, 989, 6),
			teleportPosition = Position(32369, 32234, 7),
			destinationPosition = Position(1143, 988, 6),
		},
		 ["Friday"] = {
		 	bossName = "Morshabaal",
		 	bossPosition = Position(1185, 989, 6),
		 	teleportPosition = Position(32369, 32234, 7),
		 	destinationPosition = Position(1143, 988, 6),
		 },
		["Saturday"] = {
			bossName = "Aries",
			bossPosition = Position(1185, 989, 6),
			teleportPosition = Position(32369, 32234, 7),
			destinationPosition = Position(1143, 988, 6),
		},
		["Sunday"] = {
			bossName = "Ferumbras",
			bossPosition = Position(32254, 32175, 12),
			teleportPosition = Position(32369, 32234, 7),
			destinationPosition = Position(32254, 32181, 13),
		},
	},
	spawnTime = "20:00:00",
	rewardList = {
		{ id = 39546, name = "Primal bag", count = 1 },
		{ id = 43895, name = "Bag you covet", count = 1 },
		{ id = 14758, name = "One day vip scroll", count = 1 },
	},
}

local DailyBossRespawn = GlobalEvent("DailyBossRespawn")
function DailyBossRespawn.onTime(interval)
	local day = config.days[os.date("%A")]
	if day then
		local item = Game.createItem(config.teleportId, 1, day.teleportPosition)
		if item then
			if not item:isTeleport() then
				item:remove()
				return false
			end
			item:setDestination(day.destinationPosition)
		end
		addEvent(function()
			Game.createMonster(day.bossName, day.bossPosition, false, true)
			Game.broadcastMessage(day.bossName .. " has appeared! Face the challenge if you dare!", MESSAGE_GAME_HIGHLIGHT)
		end, 5000)
	end
	return true
end

DailyBossRespawn:time(config.spawnTime)
DailyBossRespawn:register()

local DailyBossDeath = CreatureEvent("DailyBossDeath")

function DailyBossDeath.onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
	local bossName = creature:getName():lower()

	local day = config.days[os.date("%A")]
	if day and bossName:lower() == day.bossName:lower() then
		-- Remove o teleporte quando o boss é derrotado
		local teleport = Tile(day.teleportPosition):getItemById(config.teleportId)
		if teleport then
			teleport:remove()
			Game.broadcastMessage(day.bossName .. " has been defeated! The teleport has disappeared.", MESSAGE_GAME_HIGHLIGHT)
		end

		-- Lógica para premiar o jogador que deu mais dano
		if mostdamagekiller and mostdamagekiller:isPlayer() then
			local reward = config.rewardList[math.random(#config.rewardList)]
			if reward then
				mostdamagekiller:addItem(reward.id, reward.count)
				local playerName = mostdamagekiller:getName()
				Game.broadcastMessage("Congratulations to " .. playerName .. ", who dealt the most damage to " .. bossName .. " and received a " .. reward.name .. "!", MESSAGE_GAME_HIGHLIGHT)
				logger.info("Player " .. playerName .. " received item: " .. reward.name .. " (ID: " .. reward.id .. ")")
			else
				logger.info("No reward could be determined for player " .. mostdamagekiller:getName() .. ".")
			end
		else
			Game.broadcastMessage("No player dealt significant damage to " .. bossName .. ".", MESSAGE_GAME_HIGHLIGHT)
		end
	end
	return true
end

DailyBossDeath:register()
