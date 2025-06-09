-- Qual item abre qual categoria de task?
local taskItemToCategory = {
    [31471] = 1,  -- geral
    [31473] = 2,  -- boss
    --[31473] = 3,  -- novo item C
}

local function getBonusMult(player)
    return player:getStorageValue(taskOptions.bonusReward) >= 1
           and taskOptions.bonusRate or 1
end

local function payReward(player, info, mult, window)
    local label = "- "

    if info[1] == "exp" then
        local amount = info[2] * mult
        player:addExperience(amount)
        player:say("Exp: " .. amount, TALKTYPE_MONSTER_SAY)
        label = label .. "Experience: " .. amount

    elseif info[1] == "gold" then
        local amount = info[2] * mult
        Bank.credit(player:getName(), amount)
        player:say("Gold: " .. amount, TALKTYPE_MONSTER_SAY)
        label = label .. "Gold: " .. amount

    elseif info[1] == "level" then
        local rewardLevel = 0
        if player:getLevel() <= 3000 then rewardLevel = 3
        elseif player:getLevel() <= 5000 then rewardLevel = 2
        else rewardLevel = 1 end
        rewardLevel = rewardLevel * mult
        local newLevel = player:getLevel() + rewardLevel
        local addExp   = Game.getExperienceForLevel(newLevel) - player:getExperience()
        player:addExperience(addExp, false)
        player:say("Level: " .. rewardLevel, TALKTYPE_MONSTER_SAY)
        label = label .. "Level: " .. rewardLevel

    elseif info[1] == "random" then               -- se você usar random
        local pool   = info[2]
        local choice = pool[math.random(#pool)]
        player:addItem(choice[1], (choice[2] or 1) * mult)
        label = label .. "Random item"

    elseif tonumber(info[1]) then                 -- item fixo
        local amount = info[2] * mult
        player:addItem(info[1], amount)
        label = label .. amount .. " " .. ItemType(info[1]):getName()
    end

    -- efeitos visuais/sonoros comuns
    player:getPosition():sendMagicEffect(CONST_ME_PRISMATIC_SPARK)
    player:getPosition():sendSingleSoundEffect(
        SOUND_EFFECT_TYPE_ACTION_LEVEL_ACHIEVEMENT,
        player:isInGhostMode() and nil or player
    )
    window:addChoice(label)
end

function endTaskModalWindow(player, storage, category)
    local data = getTaskByStorage(storage)
    local finished      = player:getTaskKills(data.storagecount) >= data.total
    local title         = "Task System"
    local message       = finished and
                          ("You completed the task" .. (data.rewards and "\nHere are your rewards:" or "")) or
                          "You have already completed, or are in progress on this task."
    local window        = ModalWindow({ title = title, message = message })

    if not finished then
        player:getPosition():sendSingleSoundEffect(
            SOUND_EFFECT_TYPE_DIST_ATK_THROW_SHOT,
            player:isInGhostMode() and nil or player
        )
    end

    if finished and data.rewards then
        player:endTask(storage, false)
        player:say("Redeemed Reward:", TALKTYPE_MONSTER_SAY)

        local mult = getBonusMult(player)
        for _, info in ipairs(data.rewards) do
            payReward(player, info, mult, window)
        end

        player:setStorageValue(taskOptions.uniqueTaskStorage, -1)
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
	window:addButton("Back", function() sendTaskModalWindow(player, category) end)
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
				elseif info[1] == "random" then
					window:addChoice("- Random item from boss")
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
				elseif info[1] == "random" then
					window:addChoice("- Random item from boss")
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
	local availableTasks = {}
	local completedTasks = {}
	
    for _, data in pairs(taskConfiguration) do
        if not category or data.category == category then
            temptasks[#temptasks + 1] = data.storage
            if player:hasStartedTask(data.storage) then
                if player:getTaskKills(data.storagecount) >= data.total then
                    window:addChoice(data.name .. " [Reward on Hold]")
                    completedTasks[#completedTasks + 1] = data
                else
                    window:addChoice(data.name .. " [" .. player:getTaskKills(data.storagecount) .. "/" .. data.total .. "]")
                end
            elseif player:canStartCustomTask(data.storage) == false then
                if data.type == "daily" then
                    window:addChoice(data.name .. ", [Concluded Daily]")
                else
                    window:addChoice(data.name .. ", [Concluded]")
                end
            else
                window:addChoice(data.name .. ", " .. data.total)
                availableTasks[#availableTasks + 1] = data.storage
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

	local function acceptAllCallback(player, button, choice)
		if taskOptions.uniqueTask == true and player:getStorageValue(taskOptions.uniqueTaskStorage) >= 1 then
			uniqueModalWindow(player, category)
			return
		end

		local acceptedCount = 0
		for _, storage in ipairs(availableTasks) do
			if player:canStartCustomTask(storage) then
				player:startTask(storage)
				acceptedCount = acceptedCount + 1
			end
		end

		if acceptedCount > 0 then
			player:setStorageValue(taskOptions.uniqueTaskStorage, 1)
			player:getPosition():sendMagicEffect(CONST_ME_TREASURE_MAP)
			player:getPosition():sendSingleSoundEffect(SOUND_EFFECT_TYPE_ACTION_NOTIFICATION, player:isInGhostMode() and nil or player)
			acceptedTaskModalWindow(player, category)
		else
			errorModalWindow(player, category)
		end
	end

	local function collectAllCallback(player, button, choice)
		if #completedTasks == 0 then
			errorModalWindow(player, category)
			return
		end

		local title = "Task System"
		local message = "You collected rewards from all completed tasks!"
		local window = ModalWindow({ title = title, message = message })

		player:say("Redeemed Rewards:", TALKTYPE_MONSTER_SAY)
		player:getPosition():sendMagicEffect(CONST_ME_PRISMATIC_SPARK)
		player:getPosition():sendSingleSoundEffect(SOUND_EFFECT_TYPE_ACTION_LEVEL_ACHIEVEMENT, player:isInGhostMode() and nil or player)

		local mult = getBonusMult(player)
		for _, data in ipairs(completedTasks) do
			player:endTask(data.storage, false)
			if data.rewards then
				for _, info in ipairs(data.rewards) do
					payReward(player, info, mult, window)
				end
			end
		end

		player:setStorageValue(taskOptions.uniqueTaskStorage, -1)
		window:addButton("Back", function() sendTaskModalWindow(player, category) end)
		window:sendToPlayer(player)
	end

	window:addButton("Choose", confirmCallback)
    window:addButton("Cancel", cancelCallback)
    window:addButton("Accept All", acceptAllCallback)
    if #completedTasks > 0 then
        window:addButton("Collect All", collectAllCallback)
		window:setDefaultEscapeButton(4)
	else 
		window:setDefaultEscapeButton(3)
	end
    window:addButton("Exit")

	
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

local taskBoss = Action()

function taskBoss.onUse(player, item, fromPosition, target, toPosition, isHotkey)

    local currentCategory = taskItemToCategory[item:getId()]
    if not currentCategory then
        return true -- item não mapeado
    end

	player:getPosition():sendMagicEffect(CONST_ME_TREASURE_MAP)
	sendTaskModalWindow(player, currentCategory)
	player:getPosition():sendSingleSoundEffect(SOUND_EFFECT_TYPE_PHYSICAL_RANGE_MISS, player:isInGhostMode() and nil or player)

	return true
end

taskBoss:id(31473)
taskBoss:register()
