taskOptions = {
	bonusReward = 65001, -- storage bonus reward
	bonusRate = 2, -- rate bonus reward
	taskBoardPositions = {
		{ x = 1062, y = 1027, z = 7 },
	},
	selectLanguage = 2, -- options: 1 = pt_br or 2 = english
	uniqueTask = true, -- do one task at a time
	uniqueTaskStorage = 65002
}

task_pt_br = {
	exitButton = "Fechar",
	confirmButton = "Validar",
	cancelButton = "Anular",
	returnButton = "Voltar",
	title = "Quadro De Miss�es",
	missionError = "Miss�o esta em andamento ou ela j� foi concluida.",
	uniqueMissionError = "Voc� s� pode fazer uma miss�o por vez.",
	missionErrorTwo = "Voc� concluiu a miss�o",
	missionErrorTwoo = "\nAqui est�o suas recompensas:",
	choiceText = "- Experi�ncia: ",
	messageAcceptedText = "Voc� aceitou essa miss�o!",
	messageDetailsText = "Detalhes da miss�o:",
	choiceMonsterName = "Miss�o: ",
	choiceMonsterRace = "Ra�as: ",
	choiceMonsterKill = "Abates: ",
	choiceEveryDay = "Repeti��o: Todos os dias",
	choiceRepeatable = "Repeti��o: Sempre",
	choiceOnce = "Repeti��o: Apenas uma vez",
	choiceReward = "Recompensas:",
	messageAlreadyCompleteTask = "Voc� j� concluiu essa miss�o.",
	choiceCancelTask = "Voc� cancelou essa miss�o",
	choiceCancelTaskError = "Voc� n�o pode cancelar essa miss�o, porque ela j� foi conclu�da ou n�o foi iniciada.",
	choiceBoardText = "Escolha uma miss�o e use os bot�es abaixo:",
	choiceRewardOnHold = "Resgatar Pr�mio",
	choiceDailyConclued = "Di�ria Conclu�da",
	choiceConclued = "Conclu�da",
	messageTaskBoardError = "O quadro de miss�es esta muito longe ou esse n�o � o quadro de miss�es correto.",
	messageCompleteTask = "Voc� terminou essa miss�o! \nRetorne para o quadro de miss�es e pegue sua recompensa.",
}

taskConfiguration = {

	{
		name = "Minotaur",
		color = 40,
		total = 5000,
		type = "once",
		storage = 190000,
		storagecount = 190001,
		rewards = {
			{ 5804, 1 }, --nose ring
			{ "exp", 15000000 },
			{ "gold", 20000000}
		},
		races = {
			"Minotaur",
			"Minotaur Archer",
			"Minotaur Mage",
		},
	},

	{
		name = "Amazon",
		color = 40,
		total = 30000,
		type = "once",
		storage = 190002,
		storagecount = 190003,
		rewards = {
			{ "exp", 30000000 },
			{ "gold", 20000000 },
			{ 3437, 1 },
		},
		races = {
			"Amazon",
			"Valkyrie",
			"Xenia",
		},
	},

	{
		name = "Dragon Lord",
		color = 40,
		total = 30000,
		type = "once",
		storage = 190004,
		storagecount = 190005,
		rewards = {
			{ 5919, 1 }, --dragon claw
			{ "exp", 20000000 },
			{ "gold", 10000000 },
		},
		races = {
			"Dragon Lord",
			"Dragon Lord Hatchling",
		},
	},

	{
		name = "Frazzlemaw",
		color = 40,
		total = 5000,
		type = "daily",
		storage = 190006,
		storagecount = 190007,
		rewards = {
			{ "exp", 20000000 },
			{ "gold", 25000000 },
			{ 22721, 2 },
			{ 22516, 2}
		},
		races = {
			"Weakened Frazzlemaw",
			"Frazzlemaw",
			"Memory Of A Frazzlemaw",
			"Guzzlemaw",
			"Mawhawk",
		},
	},

	{
		name = "Dawnfire Asura",
		color = 40,
		total = 5000,
		type = "daily",
		storage = 190008,
		storagecount = 190009,
		rewards = {
			{ "exp", 50000000 },
			{ "gold", 10000000 },
		},
		races = {
			"Dawnfire Asura",
		},
	},

	{
		name = "True Dawnfire Asura",
		color = 40,
		total = 5000,
		type = "daily",
		storage = 190010,
		storagecount = 190011,
		rewards = {
			{ "exp", 60000000 },
			{ "gold", 15000000 },
		},
		races = {
			"True Dawnfire Asura",
			"True Midnight Asura",
			"True Frost Flower Asura"
		},
	},

	{
		name = "Crazed Summer Rearguard",
		color = 40,
		total = 5000,
		type = "daily",
		storage = 190012,
		storagecount = 190013,
		rewards = {
			{ "exp", 50000000 },
			{ "gold", 10000000 },
		},
		races = {
			"Crazed Summer Rearguard",
		},
	},

	{
		name = "Crazed Winter Vanguard",
		color = 40,
		total = 5000,
		type = "daily",
		storage = 190014,
		storagecount = 190015,
		rewards = {
			{ "exp", 50000000 },
			{ "gold", 10000000 },
		},
		races = {
			"Crazed Winter Vanguard",
		},
	},

	{
		name = "Falcon Knight",
		color = 40,
		total = 5000,
		type = "daily",
		storage = 190016,
		storagecount = 190017,
		rewards = {
			{ "exp", 50000000 },
			{ "gold", 10000000 },
		},
		races = {
			"Falcon Knight",
			"Falcon Paladin",
		},
	},
}

squareWaitTime = 5000
taskQuestLog = 65000 -- A storage so you get the quest log
dailyTaskWaitTime = 20 * 60 * 60

function Player.getCustomActiveTasksName(self)
	local player = self
	if not player then
		return false
	end
	local tasks = {}
	for i, data in pairs(taskConfiguration) do
		if player:getStorageValue(data.storagecount) ~= -1 then
			tasks[#tasks+1] = data.name
		end
	end
	return #tasks > 0 and tasks or false
end

function getTaskByStorage(storage)
	for i, data in pairs(taskConfiguration) do
		if data.storage == tonumber(storage) then
			return data
		end
	end
	return false
end

function getTaskByMonsterName(name)
	for i, data in pairs(taskConfiguration) do
		for _, dataList in ipairs(data.races) do
			if dataList:lower() == name:lower() then
				return data
			end
		end
	end
	return false
end

function Player.startTask(self, storage)
	local player = self
	if not player then
		return false
	end
	local data = getTaskByStorage(storage)
	if data == false then
		return false
	end
	if player:getStorageValue(taskQuestLog) == -1 then
		player:setStorageValue(taskQuestLog, 1)
	end
	player:setStorageValue(storage, player:getStorageValue(storage) + 1)
	player:setStorageValue(data.storagecount, 0)
	return true
end

function Player.canStartCustomTask(self, storage)
	local player = self
	if not player then
		return false
	end
	local data = getTaskByStorage(storage)
	if data == false then
		return false
	end
	if data.type == "daily" then
		return os.time() >= player:getStorageValue(storage)
	elseif data.type == "once" then
		return player:getStorageValue(storage) == -1
	elseif data.type[1] == "repeatable" and data.type[2] ~= -1 then
		return player:getStorageValue(storage) < (data.type[2] - 1)
	else
		return true
	end
end

function Player.endTask(self, storage, prematurely)
	local player = self
	if not player then
		return false
	end
	local data = getTaskByStorage(storage)
	if data == false then
		return false
	end
	if prematurely then
		if data.type == "daily" then
			player:setStorageValue(storage, -1)
		else
			player:setStorageValue(storage, player:getStorageValue(storage) - 1)
		end
	else
		if data.type == "daily" then
			player:setStorageValue(storage, os.time() + dailyTaskWaitTime)
		end
	end
	player:setStorageValue(data.storagecount, -1)
	return true
end

function Player.hasStartedTask(self, storage)
	local player = self
	if not player then
		return false
	end
	local data = getTaskByStorage(storage)
	if data == false then
		return false
	end
	return player:getStorageValue(data.storagecount) ~= -1
end

function Player.getTaskKills(self, storage)
	local player = self
	if not player then
		return false
	end
	return player:getStorageValue(storage)
end

function Player.addTaskKill(self, storage, count)
	local player = self
	if not player then
		return false
	end
	local data = getTaskByStorage(storage)
	if data == false then
		return false
	end
	local kills = player:getTaskKills(data.storagecount)
	if kills >= data.total then
		return false
	end
	if kills + count >= data.total then
		if taskOptions.selectLanguage == 1 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, task_pt_br.messageCompleteTask)
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Task System] You have finished this task! To claim your rewards, return to the quest board and claim your reward.")
		end
		return player:setStorageValue(data.storagecount, data.total)
	end
	player:say('Task: ' .. data.name .. ' - [' .. kills + count .. '/' .. data.total .. ']', TALKTYPE_MONSTER_SAY)
	return player:setStorageValue(data.storagecount, kills + count)
end
