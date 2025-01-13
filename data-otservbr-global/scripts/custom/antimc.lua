local config = {
	max = 4,
	maxOutsidePZ = 4, -- Máximo de jogadores fora da zona de proteção
	text = "Only 4 characters allowed per IP.",
	group_id = 1, -- Aplica o limite aos jogadores com grupo menor ou igual ao id
	milliseconds_before_kick_to_read_popup = 9000, -- 9000 = 9 segundos
	checkInterval = 60000, -- Intervalo de verificação em milissegundos (60 segundos)
}
local accepted_ip_list = {} -- Aqui coloque os IPs que deseja permitir o uso de Mc/Magebomb..

function delayedKickPlayerMCLimit(cid)
	local player = Creature(cid)
	if player and player:isPlayer() then
		player:remove()
	end
end

local antimc = CreatureEvent("AntiMC")

function antimc.onLogin(player)
	checkPlayers() -- Inicia a verificação periódica no login
	return true
end

function checkPlayers()
	local players = Game.getPlayers()
	for _, player in ipairs(players) do
		if player:getGroup():getId() <= config.group_id then
			local ip = Game.convertIpToString(player:getIp())
			if not isInArray(accepted_ip_list, ip) then
				local playersByIP = getPlayersByIPAddress(player:getIp())
				local totalPlayers = #playersByIP
				local playersOutsidePZ = 0

				if totalPlayers > config.max then
					addEvent(delayedKickPlayerMCLimit, config.milliseconds_before_kick_to_read_popup, player:getId())
				end

				for i = 1, totalPlayers do
					if not Player(playersByIP[i]):getTile():hasFlag(TILESTATE_PROTECTIONZONE) then
						playersOutsidePZ = playersOutsidePZ + 1
					end
				end

				if totalPlayers > config.max or playersOutsidePZ > config.maxOutsidePZ then
					if not player:getTile():hasFlag(TILESTATE_PROTECTIONZONE) then
						addEvent(delayedKickPlayerMCLimit, config.milliseconds_before_kick_to_read_popup, player:getId())
					end
				end
			end
		end
	end
	addEvent(checkPlayers, config.checkInterval)
end

antimc:register()

-- Inicia a verificação periódica na inicialização do script
addEvent(checkPlayers, config.checkInterval)
