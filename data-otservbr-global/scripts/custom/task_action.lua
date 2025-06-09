-- Qual item abre qual categoria de task?
local taskItemToCategory = {
    [31471] = 1,  -- geral
    [31472] = 2,  -- boss
    --[31473] = 3,  -- novo item C
}

function endTaskModalWindow(player, storage, category)
	local data = getTaskByStorage(storage)
	local newmessage
	local completion = false
	if player:getTaskKills(data.storagecount) < data.total then
		newmessage = "You have already completed, or are in progress on this task."
		player:getPosition():sendSingleSoundEffect(SOUND_EFFECT_TYPE_DIST_ATK_THROW_SHOT, player:isInGhostMode() and nil or player)
	else
		player:endTask(storage, false)
		completion = true
		newmessage = "You completed the task" .. (data.rewards and "\nHere are your rewards:" or "")
	end
	local title = "Task System"
	local window = ModalWindow({
		title = title,
		message = newmessage,
	})
	if completion and data.rewards then
		if player:getStorageValue(taskOptions.bonusReward) >= 1 then
			player:say("Redeemed Reward:", TALKTYPE_MONSTER_SAY)
			for _, info in pairs(data.rewards) do
				if info[1] == "exp" then
					player:addExperience(info[2] * taskOptions.bonusRate)
					player:getPosition():sendMagicEffect(CONST_ME_PRISMATIC_SPARK)
					player:say("Exp: " .. info[2] * taskOptions.bonusRate .. "", TALKTYPE_MONSTER_SAY)
					if taskOptions.selectLanguage == 1 then
						window:addChoice(task_pt_br.choiceText .. "" .. info[2] * taskOptions.bonusRate)
					else
						window:addChoice("- Experience: " .. info[2] * taskOptions.bonusRate)
					end
				elseif info[1] == "gold" then
					Bank.credit(player:getName(), tonumber(info[2]))
					player:getPosition():sendMagicEffect(CONST_ME_PRISMATIC_SPARK)
					player:say("Gold: " .. info[2], TALKTYPE_MONSTER_SAY)
					window:addChoice("- Gold: " .. info[2])
				elseif info[1] == "level" then
					local rewardLevel = 0
					if player:getLevel() <= 3000 then
						rewardLevel = 3
					elseif player:getLevel() >= 3001 and player:getLevel() <= 5000 then
						rewardLevel = 2
					elseif player:getLevel() >= 5001 then
						rewardLevel = 1
					end
					local targetNewLevel = player:getLevel() + rewardLevel
					local targetNewExp = Game.getExperienceForLevel(targetNewLevel)
					local experienceToAdd = targetNewExp - player:getExperience()
					player:addExperience(experienceToAdd, false)
					player:getPosition():sendMagicEffect(CONST_ME_PRISMATIC_SPARK)
					player:say("Level: " .. rewardLevel, TALKTYPE_MONSTER_SAY)
					window:addChoice("- Level: " .. rewardLevel)
				elseif tonumber(info[1]) then
					window:addChoice("- " .. info[2] * taskOptions.bonusRate .. " " .. ItemType(info[1]):getName())
					player:addItem(info[1], info[2] * taskOptions.bonusRate)
					player:setStorageValue(taskOptions.uniqueTaskStorage, -1)
					player:getPosition():sendSingleSoundEffect(SOUND_EFFECT_TYPE_ACTION_LEVEL_ACHIEVEMENT, player:isInGhostMode() and nil or player)
					player:getPosition():sendMagicEffect(CONST_ME_PRISMATIC_SPARK)
					if taskOptions.selectLanguage == 1 then
						player:say("Outros: " .. info[2] * taskOptions.bonusRate .. " " .. ItemType(info[1]):getName(), TALKTYPE_MONSTER_SAY)
					else
						player:say("Others: " .. info[2] * taskOptions.bonusRate .. " " .. ItemType(info[1]):getName(), TALKTYPE_MONSTER_SAY)
					end
					--player:setStorageValue(storagecheck, player:getStorageValue(storagecheck) + 1)
				end
			end
		else
			player:say("Redeemed Reward:", TALKTYPE_MONSTER_SAY)
			for _, info in pairs(data.rewards) do
				if info[1] == "exp" then
					player:addExperience(info[2])
					player:getPosition():sendMagicEffect(CONST_ME_PRISMATIC_SPARK)
					player:say("Exp: " .. info[2] .. "", TALKTYPE_MONSTER_SAY)
					window:addChoice("- Experience: " .. info[2])
				elseif info[1] == "gold" then
					Bank.credit(player:getName(), tonumber(info[2]))
					player:getPosition():sendMagicEffect(CONST_ME_PRISMATIC_SPARK)
					player:say("Gold: " .. info[2], TALKTYPE_MONSTER_SAY)
					window:addChoice("- Gold: " .. info[2])
				elseif info[1] == "level" then
					local rewardLevel = 0
					if player:getLevel() <= 3000 then
						rewardLevel = 3
					elseif player:getLevel() >= 3001 and player:getLevel() <= 5000 then
						rewardLevel = 2
					elseif player:getLevel() >= 5001 then
						rewardLevel = 1
					end
					local targetNewLevel = player:getLevel() + rewardLevel
					local targetNewExp = Game.getExperienceForLevel(targetNewLevel)
					local experienceToAdd = targetNewExp - player:getExperience()
					player:addExperience(experienceToAdd, false)
					player:getPosition():sendMagicEffect(CONST_ME_PRISMATIC_SPARK)
					player:say("Level: " .. rewardLevel, TALKTYPE_MONSTER_SAY)
					window:addChoice("- Level: " .. rewardLevel)
				elseif tonumber(info[1]) then
					window:addChoice("- " .. info[2] .. " " .. ItemType(info[1]):getName())
					player:addItem(info[1], info[2])
					player:setStorageValue(taskOptions.uniqueTaskStorage, -1)
					player:getPosition():sendSingleSoundEffect(SOUND_EFFECT_TYPE_ACTION_LEVEL_ACHIEVEMENT, player:isInGhostMode() and nil or player)
					player:getPosition():sendMagicEffect(CONST_ME_PRISMATIC_SPARK)
					player:say("Others: " .. ItemType(info[1]):getName() .. "", TALKTYPE_MONSTER_SAY)
					--player:setStorageValue(storagecheck, player:getStorageValue(storagecheck) + 1)
				end
			end
		end
	end

	window:addButton("Back", function() sendTaskModalWindow(player, category) end)
	window:sendToPlayer(player)
end

function acceptedTaskModalWindow(player, category)
	local title = taskOptions.selectLanguage == 1 and task_pt_br.title or "Task System"
	local customMessage = taskOptions.selectLanguage == 1 and task_pt_br.messageAcceptedText or "You accepted this task!"
	local window = ModalWindow({
		title = title,
		message = customMessage,
	})
	player:getPosition():sendMagicEffect(CONST_ME_TREASURE_MAP)
	if taskOptions.selectLanguage == 1 then
		window:addButton(task_pt_br.returnButton, function()
			sendTaskModalWindow(player, category)
		end)
	else
		window:addButton("Back", function()
			sendTaskModalWindow(player, category)
		end)
	end
	window:sendToPlayer(player)
end

function confirmTaskModalWindow(player, storage, category)
	local title = taskOptions.selectLanguage == 1 and task_pt_br.title or "Task System"
	local detailsMessage = taskOptions.selectLanguage == 1 and task_pt_br.messageDetailsText or "Here are the details of your task:"
	local window = ModalWindow({
		title = title,
		message = detailsMessage,
	})
	local data = getTaskByStorage(storage)
	if taskOptions.selectLanguage == 1 then
		window:addChoice(task_pt_br.choiceMonsterName .. "" .. data.name)
		window:addChoice(task_pt_br.choiceMonsterRace .. "")
		for _, races in pairs(data.races) do
			window:addChoice("[" .. races .. "]")
		end
		window:addChoice(task_pt_br.choiceMonsterKill .. "" .. data.total)
		if data.type == "daily" then
			window:addChoice(task_pt_br.choiceEveryDay)
		elseif data.type == "repeatable" then
			window:addChoice(task_pt_br.choiceRepeatable)
		elseif data.type == "once" then
			window:addChoice(task_pt_br.choiceOnce)
		end
	else
		window:addChoice("Task name: " .. data.name)
		window:addChoice("Monster races: ")
		for _, races in pairs(data.races) do
			window:addChoice("[" .. races .. "]")
		end
		window:addChoice("Necessary deaths: " .. data.total)
		if data.type == "daily" then
			window:addChoice("You can repeat: Every day!")
		elseif data.type == "repeatable" then
			window:addChoice("You can repeat: Always!")
		elseif data.type == "once" then
			window:addChoice("You can repeat: Only once!")
		end
	end
	if data.rewards then
		if taskOptions.selectLanguage == 1 then
			window:addChoice(task_pt_br.choiceReward)
		else
			window:addChoice("Rewards:")
		end
		if player:getStorageValue(taskOptions.bonusReward) >= 1 then
			for _, info in pairs(data.rewards) do
				if info[1] == "exp" then
					if taskOptions.selectLanguage == 1 then
						window:addChoice(task_pt_br.choiceText .. "" .. info[2] * taskOptions.bonusRate)
					else
						window:addChoice("- Experience: " .. info[2] * taskOptions.bonusRate)
					end
				elseif info[1] == "gold" then
					window:addChoice("- Gold: " .. info[2])
				elseif info[1] == "level" then
					local rewardLevel = 0
					if player:getLevel() <= 3000 then
						rewardLevel = 3
					elseif player:getLevel() >= 3001 and player:getLevel() <= 5000 then
						rewardLevel = 2
					elseif player:getLevel() >= 5001 then
						rewardLevel = 1
					end
					window:addChoice("- Level: " .. rewardLevel)
				elseif tonumber(info[1]) then
					window:addChoice("- " .. info[2] * taskOptions.bonusRate .. " " .. ItemType(info[1]):getName())
				end
			end
		else
			for _, info in pairs(data.rewards) do
				if info[1] == "exp" then
					if taskOptions.selectLanguage == 1 then
						window:addChoice(task_pt_br.choiceText .. "" .. info[2])
					else
						window:addChoice("- Experience: " .. info[2])
					end
				elseif info[1] == "gold" then
					window:addChoice("- Gold: " .. info[2])
				elseif info[1] == "level" then
					local rewardLevel = 0
					if player:getLevel() <= 3000 then
						rewardLevel = 3
					elseif player:getLevel() >= 3001 and player:getLevel() <= 5000 then
						rewardLevel = 2
					elseif player:getLevel() >= 5001 then
						rewardLevel = 1
					end
					window:addChoice("- Level: " .. rewardLevel)
				elseif tonumber(info[1]) then
					window:addChoice("- " .. info[2] .. " " .. ItemType(info[1]):getName())
				end
			end
		end
	end
	local function confirmCallback(player, button, choice)
		if player:hasStartedTask(storage) or not player:canStartCustomTask(storage) then
			errorModalWindow(player, category)
		elseif taskOptions.uniqueTask == true and player:getStorageValue(taskOptions.uniqueTaskStorage) == 1 then
			uniqueModalWindow(player, category)
		else
			acceptedTaskModalWindow(player, category)
			player:startTask(storage)
			player:setStorageValue(taskOptions.uniqueTaskStorage, 1)
			player:getPosition():sendSingleSoundEffect(SOUND_EFFECT_TYPE_ACTION_NOTIFICATION, player:isInGhostMode() and nil or player)
		end
	end

	window:addButton("Choose", confirmCallback)
	window:addButton("Back", function() sendTaskModalWindow(player, category) end)

	window:sendToPlayer(player)
end

function errorModalWindow(player, category)
	local title = taskOptions.selectLanguage == 1 and task_pt_br.title or "Task System"
	local completedMessage = taskOptions.selectLanguage == 1 and task_pt_br.messageAlreadyCompleteTask or "You have already completed this task."
	local window = ModalWindow({
		title = title,
		message = completedMessage,
	})
	player:getPosition():sendMagicEffect(CONST_ME_STUN)
	player:getPosition():sendSingleSoundEffect(SOUND_EFFECT_TYPE_DIST_ATK_THROW_SHOT, player:isInGhostMode() and nil or player)
	if taskOptions.selectLanguage == 1 then
		window:addButton(task_pt_br.returnButton, function()
			sendTaskModalWindow(player, category)
		end)
	else
		window:addButton("Back", function()
			sendTaskModalWindow(player, category)
		end)
	end
	window:sendToPlayer(player)
end

function uniqueModalWindow(player, category)
	local title = taskOptions.selectLanguage == 1 and task_pt_br.title or "Task System"
	local completedMessage = taskOptions.selectLanguage == 1 and task_pt_br.uniqueMissionError or "You can only do one mission at a time."
	local window = ModalWindow({
		title = title,
		message = completedMessage,
	})
	player:getPosition():sendMagicEffect(CONST_ME_POFF)
	player:getPosition():sendSingleSoundEffect(SOUND_EFFECT_TYPE_DIST_ATK_THROW_SHOT, player:isInGhostMode() and nil or player)
	if taskOptions.selectLanguage == 1 then
		window:addButton(task_pt_br.returnButton, function()
			sendTaskModalWindow(player, category)
		end)
	else
		window:addButton("Back", function()
			sendTaskModalWindow(player, category)
		end)
	end
	window:sendToPlayer(player)
end

function cancelTaskModalWindow(player, managed, category)
	local newmessage
	if managed then
		if taskOptions.selectLanguage == 1 then
			newmessage = task_pt_br.choiceCancelTask
		else
			newmessage = "You canceled this task."
		end
	else
		if taskOptions.selectLanguage == 1 then
			newmessage = task_pt_br.choiceCancelTaskError
		else
			newmessage = "You cannot cancel this task, because it is already completed or not started."
		end
	end
	local title = taskOptions.selectLanguage == 1 and task_pt_br.title or "Task System"
	local window = ModalWindow({
		title = title,
		message = newmessage,
	})
	player:getPosition():sendMagicEffect(CONST_ME_EXPLOSIONAREA)
	player:getPosition():sendSingleSoundEffect(SOUND_EFFECT_TYPE_DIST_ATK_THROW_SHOT, player:isInGhostMode() and nil or player)
	if taskOptions.selectLanguage == 1 then
		window:addButton(task_pt_br.returnButton, function()
			sendTaskModalWindow(player, category)
		end)
	else
		window:addButton("Back", function()
			sendTaskModalWindow(player, category)
		end)
	end
	window:sendToPlayer(player)
end

local function confirmCancelTaskModalWindow(player, storage, category)
    local title   = (taskOptions.selectLanguage == 1) and "Cancelar Missão"  or "Cancel Task"
    local message = (taskOptions.selectLanguage == 1)
                    and "Tem certeza de que deseja cancelar esta missão?\nTodo o progresso será perdido."
                    or  "Are you sure you want to cancel this task?\nAll progress will be lost."

    local window = ModalWindow({ title = title, message = message })

    local function doCancel()
        player:endTask(storage, true)                       -- perde progresso
        player:setStorageValue(taskOptions.uniqueTaskStorage, -1)
        cancelTaskModalWindow(player, true, category)                 -- modal já existente de sucesso
    end

    if taskOptions.selectLanguage == 1 then
        window:addButton("Sim",  doCancel)
        window:addButton("Não",  function() sendTaskModalWindow(player, category) end)
    else
        window:addButton("Yes",  doCancel)
        window:addButton("No",   function() sendTaskModalWindow(player, category) end)
    end

    window:setDefaultEscapeButton(2)
    window:sendToPlayer(player)
end

function sendTaskModalWindow(player, category)
	local title = "Task System"
	local taskButtonMessage = "Choose a task and use the buttons below:"
	local window = ModalWindow({
		title = title,
		message = taskButtonMessage,
	})
	local temptasks = {}
	
    for _, data in pairs(taskConfiguration) do
        if not category or data.category == category then
            temptasks[#temptasks + 1] = data.storage
            if player:hasStartedTask(data.storage) then
                window:addChoice(data.name .. " [" .. (player:getTaskKills(data.storagecount) >= data.total and "Reward on Hold]" or player:getTaskKills(data.storagecount) .. "/" .. data.total .. "]"))
            elseif player:canStartCustomTask(data.storage) == false then
                if data.type == "daily" then
                    window:addChoice(data.name .. ", [Concluded Daily]")
                else
                    window:addChoice(data.name .. ", [Concluded]")
                end
            else
                window:addChoice(data.name .. ", " .. data.total)
            end
        end		
	end

	local function confirmCallback(player, button, choice)
		local id = choice.id
		if player:hasStartedTask(temptasks[id]) then
			endTaskModalWindow(player, temptasks[id], category)
		elseif not player:canStartCustomTask(temptasks[id]) then
			errorModalWindow(player, category)
		elseif taskOptions.uniqueTask == true and player:getStorageValue(taskOptions.uniqueTaskStorage) >= 1 then
			uniqueModalWindow(player, category)
		else
			confirmTaskModalWindow(player, temptasks[id], category)
		end
	end

	local function cancelCallback(player, button, choice)
		local id = choice.id
		if player:hasStartedTask(temptasks[id]) then
			confirmCancelTaskModalWindow(player, temptasks[id], category)
		else
			cancelTaskModalWindow(player, false, category)
		end
	end

	window:addButton("Choose", confirmCallback)
    window:addButton("Cancel", cancelCallback)
    window:addButton("Exit")

	window:setDefaultEscapeButton(2)
	window:sendToPlayer(player)
end

local task = Action()

function task.onUse(player, item, fromPosition, target, toPosition, isHotkey)

    local currentCategory = taskItemToCategory[item:getId()]
    if not currentCategory then
        return true -- item não mapeado
    end

	player:getPosition():sendMagicEffect(CONST_ME_TREASURE_MAP)
	sendTaskModalWindow(player, currentCategory)
	player:getPosition():sendSingleSoundEffect(SOUND_EFFECT_TYPE_PHYSICAL_RANGE_MISS, player:isInGhostMode() and nil or player)

	return true
end

task:id(31471)
task:register()
