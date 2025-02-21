local function updateHighExpDay()
	local resultId = db.storeQuery([[
        SELECT p.id AS player_id, p.experience, h.exp_yesterday
        FROM players p
        LEFT JOIN aiolos_highexpday h ON p.id = h.player_id
		WHERE p.level > 2800
    ]])

	if resultId then
		repeat
			local playerId = Result.getNumber(resultId, "player_id")
			local currentExp = Result.getNumber(resultId, "experience")
			local expYesterday = Result.getNumber(resultId, "exp_yesterday") or 0
			local expToday = currentExp - expYesterday

			if expYesterday == 0 then
				-- Novo registro para o jogador
				db.asyncQuery("INSERT INTO aiolos_highexpday (player_id, exp_yesterday, exp_today) VALUES (" .. playerId .. ", " .. currentExp .. ", 0)")
			else
				-- Atualizar registro existente
				db.asyncQuery("UPDATE aiolos_highexpday SET exp_yesterday = " .. currentExp .. ", exp_today = " .. expToday .. " WHERE player_id = " .. playerId)
			end
		until not Result.next(resultId)

		Result.free(resultId)
	end
end

local updateTopXpDaily = GlobalEvent("Update High Exp Day")

function updateTopXpDaily.onStartup()
	logger.info("Load aiolos_highexpday ...")
	updateHighExpDay()
	logger.info("Table aiolos_highexpday done!")
end

--updateTopXpDaily:time("22:00") -- will be executed each day just after global save
updateTopXpDaily:time("20:35")
updateTopXpDaily:register()
