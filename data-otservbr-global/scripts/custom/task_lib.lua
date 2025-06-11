taskOptions = {
	bonusReward = 65001, -- storage bonus reward
	bonusRate = 2, -- rate bonus reward
	taskBoardPositions = {
		{ x = 1062, y = 1027, z = 7 },
	},
	selectLanguage = 2, -- options: 1 = pt_br or 2 = english
	uniqueTask = false, -- do one task at a time
	uniqueTaskStorage = 65002,
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
		category = 1,
		color = 40,
		total = 3000,
		type = "once",
		storage = 190000,
		storagecount = 190001,
		rewards = {
			{ 5804, 1 }, --nose ring
			{ "level", 0 },
			{ "gold", 20000000 },
		},
		races = {
			"Minotaur",
			"Minotaur Archer",
			"Minotaur Mage",
		},
	},

	{
		name = "Amazon",
		category = 1,
		color = 40,
		total = 3000,
		type = "once",
		storage = 190002,
		storagecount = 190003,
		rewards = {
			{ "level", 0 },
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
		category = 1,
		color = 40,
		total = 3000,
		type = "once",
		storage = 190004,
		storagecount = 190005,
		rewards = {
			{ 5919, 1 }, --dragon claw
			{ "level", 0 },
			{ "gold", 10000000 },
		},
		races = {
			"Dragon Lord",
			"Dragon Lord Hatchling",
		},
	},

	{
		name = "Frazzlemaw",
		category = 1,
		color = 40,
		total = 5000,
		type = "repeatable",
		storage = 190006,
		storagecount = 190007,
		rewards = {
			{ "exp", 20000000 },
			{ "gold", 25000000 },
			{ 22721, 2 },
			{ 22516, 2 },
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
		category = 1,
		color = 40,
		total = 5000,
		type = "repeatable",
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
		category = 1,
		color = 40,
		total = 5000,
		type = "repeatable",
		storage = 190010,
		storagecount = 190011,
		rewards = {
			{ "exp", 60000000 },
			{ "gold", 15000000 },
		},
		races = {
			"True Dawnfire Asura",
			"True Midnight Asura",
			"True Frost Flower Asura",
		},
	},

	{
		name = "Crazed Summer Rearguard",
		category = 1,
		color = 40,
		total = 5000,
		type = "repeatable",
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
		category = 1,
		color = 40,
		total = 5000,
		type = "repeatable",
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
		category = 1,
		color = 40,
		total = 5000,
		type = "repeatable",
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

	{
		name = "Rotten Man-Maggot",
		category = 1,
		color = 40,
		total = 55000,
		type = "repeatable",
		storage = 190018,
		storagecount = 190019,
		rewards = {
			{ 46626, 1 }, --greater fragment
			{ "level", 0 },
			{ "gold", 20000000 },
		},
		races = {
			"Rotten Man-Maggot",
			"Oozing Carcass",
			"Meandering Mushroom",
			"Sopping Carcass",
		},
	},

	{
		name = "Bloated Man-Maggot",
		category = 1,
		color = 40,
		total = 55000,
		type = "repeatable",
		storage = 190020,
		storagecount = 190021,
		rewards = {
			{ 46626, 1 }, --greater fragment
			{ "level", 0 },
			{ "gold", 20000000 },
		},
		races = {
			"Bloated Man-Maggot",
			"Mycobiontic Beetle",
			"Oozing Corpus",
			"Sopping Corpus",
		},
	},

	{
		name = "Darklight Source",
		category = 1,
		color = 40,
		total = 55000,
		type = "repeatable",
		storage = 190022,
		storagecount = 190023,
		rewards = {
			{ 46626, 1 }, --greater fragment
			{ "level", 0 },
			{ "gold", 20000000 },
		},
		races = {
			"Darklight Source",
			"Darklight Matter",
			"Walking Pillar",
			"Darklight Striker",
		},
	},

	{
		name = "Darklight Emitter",
		category = 1,
		color = 40,
		total = 55000,
		type = "repeatable",
		storage = 190024,
		storagecount = 190025,
		rewards = {
			{ 46626, 1 }, --greater fragment
			{ "level", 0 },
			{ "gold", 20000000 },
		},
		races = {
			"Darklight Emitter",
			"Wandering Pillar",
			"Converter",
		},
	},

	{
		name = "Bony Sea Devil",
		category = 1,
		color = 40,
		total = 55000,
		type = "repeatable",
		storage = 190026,
		storagecount = 190027,
		rewards = {
			{ 46626, 1 }, --greater fragment
			{ "level", 0 },
			{ "gold", 20000000 },
		},
		races = {
			"Bony Sea Devil",
			"Turbulent Elemental",
			"Capricious Phantom",
		},
	},

	{
		name = "Rotten Golem",
		category = 1,
		color = 40,
		total = 55000,
		type = "repeatable",
		storage = 190028,
		storagecount = 190029,
		rewards = {
			{ 46626, 1 }, --greater fragment
			{ "level", 0 },
			{ "gold", 20000000 },
		},
		races = {
			"Rotten Golem",
			"Branchy Crawler",
			"Mould Phantom",
		},
	},

	{
		name = "Knight's Apparition",
		category = 1,
		color = 40,
		total = 55000,
		type = "repeatable",
		storage = 190030,
		storagecount = 190031,
		rewards = {
			{ 46626, 1 }, --greater fragment
			{ "level", 0 },
			{ "gold", 20000000 },
		},
		races = {
			"Knight's Apparition",
			"Sorcerer's Apparition",
			"Druid's Apparition",
			"Paladin's Apparition",
			"Many Faces",
			"Distorted Phantom",
		},
	},

	{
		name = "Cloak Of Terror",
		category = 1,
		color = 40,
		total = 55000,
		type = "repeatable",
		storage = 190032,
		storagecount = 190033,
		rewards = {
			{ 46626, 1 }, --greater fragment
			{ "level", 0 },
			{ "gold", 20000000 },
		},
		races = {
			"Cloak Of Terror",
			"Vibrant Phantom",
			"Courage Leech",
		},
	},

	{
		name = "Infernal Demon",
		category = 1,
		color = 40,
		total = 55000,
		type = "repeatable",
		storage = 190034,
		storagecount = 190035,
		rewards = {
			{ 46626, 1 }, --greater fragment
			{ "level", 0 },
			{ "gold", 20000000 },
		},
		races = {
			"Infernal Demon",
			"Brachiodemon",
			"Infernal Phantom",
		},
	},

	{
		name = "Hulking Prehemoth",
		category = 1,
		color = 40,
		total = 55000,
		type = "repeatable",
		storage = 190036,
		storagecount = 190037,
		rewards = {
			{ 46626, 1 }, --greater fragment
			{ "level", 0 },
			{ "gold", 20000000 },
		},
		races = {
			"Hulking Prehemoth",
			"Gore Horn",
			"Sabretooth",
			"Gorerilla",
			"Emerald Tortoise",
		},
	},

	{
		name = "Noxious Ripptor",
		category = 1,
		color = 40,
		total = 55000,
		type = "repeatable",
		storage = 190038,
		storagecount = 190039,
		rewards = {
			{ 46626, 1 }, --greater fragment
			{ "level", 0 },
			{ "gold", 20000000 },
		},
		races = {
			"Noxious Ripptor",
			"Mantosaurus",
			"Mercurial Menace",
			"Gorerilla",
			"Headpecker",
		},
	},

	{
		name = "Undertaker",
		category = 1,
		color = 40,
		total = 55000,
		type = "repeatable",
		storage = 190040,
		storagecount = 190041,
		rewards = {
			{ 46626, 1 }, --greater fragment
			{ "level", 0 },
			{ "gold", 20000000 },
		},
		races = {
			"Undertaker",
			"Nighthunter",
			"Stalking Stalk",
			"Sulphider",
			"Sulphur Spouter",
		},
	},

	{
		name = "Juggernaut",
		category = 1,
		color = 40,
		total = 15000,
		type = "repeatable",
		storage = 190042,
		storagecount = 190043,
		rewards = {
			{ 46625, 1 }, --lesser fragment
			{ "exp", 25000000 },
			{ "gold", 10000000 },
		},
		races = {
			"Juggernaut",
			"Vexclaw",
			"Hellflayer",
		},
	},

	{
		name = "Floating Savant",
		category = 1,
		color = 40,
		total = 15000,
		type = "repeatable",
		storage = 190042,
		storagecount = 190043,
		rewards = {
			{ 46625, 1 }, --lesser fragment
			{ "exp", 25000000 },
			{ "gold", 10000000 },
		},
		races = {
			"Floating Savant",
			"Fury",
		},
	},

	{
		name = "Hellflayer",
		category = 1,
		color = 40,
		total = 15000,
		type = "repeatable",
		storage = 190044,
		storagecount = 190045,
		rewards = {
			{ 46625, 1 }, --lesser fragment
			{ "exp", 25000000 },
			{ "gold", 10000000 },
		},
		races = {
			"Hellflayer",
			"Grimeleech",
		},
	},

	{
		name = "Wardragon",
		category = 1,
		color = 40,
		total = 15000,
		type = "repeatable",
		storage = 190046,
		storagecount = 190047,
		rewards = {
			{ 46625, 1 }, --lesser fragment
			{ "exp", 25000000 },
			{ "gold", 10000000 },
		},
		races = {
			"Wardragon",
			"Mega Dragon",
			"Dragolisk",
		},
	},

	{
		name = "Rhindeer",
		category = 1,
		color = 40,
		total = 15000,
		type = "repeatable",
		storage = 190048,
		storagecount = 190049,
		rewards = {
			{ 46625, 1 }, --lesser fragment
			{ "exp", 25000000 },
			{ "gold", 10000000 },
		},
		races = {
			"Rhindeer",
			"Carnivostrich",
			"Boar Man",
			"Crape Man",
			"Harpy",
		},
	},
	--[[
	{
        name = "Sanguine Ember Frost",
        color = 40,
        total = 12000,
        type = "once",
        storage = 190050,
        storagecount = 190051,
        rewards = {
            { "level", 0 },
            { "gold", 20000000},
			{ 46626, 5 }, --greater fragment
			{ 65020, 1} --essence of health
        },
        races = {
        "Sanguine Ember",
		"Sanguine Frost"
        },
    },
    
	{
        name = "Sanguine Poison Energy",
        color = 40,
        total = 12000,
        type = "once",
        storage = 190052,
        storagecount = 190053,
        rewards = {
            { "level", 0 },
            { "gold", 20000000},
			{ 46626, 5 }, --greater fragment
			{ 65020, 1} --essence of health
        },
        races = {
        "Sanguine Boulder",
		"Sanguine Spark"
        },
    },
	{
        name = "Sanguine Holy Death",
        color = 40,
        total = 12000,
        type = "once",
        storage = 190054,
        storagecount = 190055,
        rewards = {
            { "level", 0 },
            { "gold", 20000000},
			{ 46626, 5 }, --greater fragment
			{ 65020, 1} --essence of health
        },
        races = {
        "Sanguine Glow",
		"Sanguine Shade"
        },
    },
    ]]

	{
		name = "Ember Frost",
		category = 1,
		color = 40,
		total = 50000,
		type = "repeatable",
		storage = 190056,
		storagecount = 190057,
		rewards = {
			{ "level", 0 },
			{ "gold", 20000000 },
			{ 46626, 5 }, --greater fragment
			{ 65020, 1 }, --essence of health
		},
		races = {
			"Sanguine Ember",
			"Sanguine Frost",
		},
	},

	{
		name = "Poison Energy",
		category = 1,
		color = 40,
		total = 50000,
		type = "repeatable",
		storage = 190058,
		storagecount = 190059,
		rewards = {
			{ "level", 0 },
			{ "gold", 20000000 },
			{ 46626, 2 }, --greater fragment
			{ 65020, 1 }, --essence of health
		},
		races = {
			"Sanguine Boulder",
			"Sanguine Spark",
		},
	},

	{
		name = "Holy Death",
		category = 1,
		color = 40,
		total = 50000,
		type = "repeatable",
		storage = 190060,
		storagecount = 190061,
		rewards = {
			{ "level", 0 },
			{ "gold", 20000000 },
			{ 46626, 2 }, --greater fragment
			{ 65020, 1 }, --essence of health
		},
		races = {
			"Sanguine Glow",
			"Sanguine Shade",
		},
	},

	{
		name = "Elite Sanguine Glow",
		category = 1,
		color = 40,
		total = 50000,
		type = "repeatable",
		storage = 190062,
		storagecount = 190063,
		rewards = {
			{ "level", 2 },
			{ "exp", 200000000 },
			{ "gold", 150000000 },
			{ 46626, 10 }, --greater fragment
			{ 65020, 2 }, --essence of health
		},
		races = {
			"Elite Sanguine Glow",
		},
	},

	{
		name = "Elite Sanguine Shade",
		category = 1,
		color = 40,
		total = 50000,
		type = "repeatable",
		storage = 190064,
		storagecount = 190065,
		rewards = {
			{ "level", 2 },
			{ "exp", 200000000 },
			{ "gold", 150000000 },
			{ 46626, 10 }, --greater fragment
			{ 65020, 2 }, --essence of health
		},
		races = {
			"Elite Sanguine Shade",
		},
	},

	{
		name = "Elite Sanguine Ember",
		category = 1,
		color = 40,
		total = 50000,
		type = "repeatable",
		storage = 190066,
		storagecount = 190067,
		rewards = {
			{ "level", 2 },
			{ "exp", 200000000 },
			{ "gold", 150000000 },
			{ 46626, 10 }, --greater fragment
			{ 65020, 2 }, --essence of health
		},
		races = {
			"Elite Sanguine Ember",
		},
	},

	{
		name = "Elite Sanguine Frost",
		category = 1,
		color = 40,
		total = 50000,
		type = "repeatable",
		storage = 190068,
		storagecount = 190069,
		rewards = {
			{ "level", 2 },
			{ "exp", 200000000 },
			{ "gold", 150000000 },
			{ 46626, 10 }, --greater fragment
			{ 65020, 2 }, --essence of health
		},
		races = {
			"Elite Sanguine Frost",
		},
	},

	{
		name = "Elite Sanguine Boulder",
		category = 1,
		color = 40,
		total = 50000,
		type = "repeatable",
		storage = 190070,
		storagecount = 190071,
		rewards = {
			{ "level", 2 },
			{ "exp", 200000000 },
			{ "gold", 150000000 },
			{ 46626, 10 }, --greater fragment
			{ 65020, 2 }, --essence of health
		},
		races = {
			"Elite Sanguine Boulder",
		},
	},

	{
		name = "Elite Sanguine Spark",
		category = 1,
		color = 40,
		total = 50000,
		type = "repeatable",
		storage = 190072,
		storagecount = 190073,
		rewards = {
			{ "level", 2 },
			{ "exp", 200000000 },
			{ "gold", 150000000 },
			{ 46626, 10 }, --greater fragment
			{ 65020, 2 }, --essence of health
		},
		races = {
			"Elite Sanguine Spark",
		},
	},

	{
		name = "Rootting",
		category = 1,
		color = 40,
		total = 55000,
		type = "repeatable",
		storage = 190074,
		storagecount = 190075,
		rewards = {
			{ 46626, 1 }, --greater fragment
			{ "level", 1 },
			{ "gold", 20000000 },
		},
		races = {
			"Rootthing Nutshell",
			"Rootthing Amber Shaper",
			"Rootthing Bug Tracker",
		},
	},

	{
		name = "Quaras",
		category = 1,
		color = 40,
		total = 55000,
		type = "repeatable",
		storage = 190076,
		storagecount = 190077,
		rewards = {
			{ 46626, 1 }, --greater fragment
			{ "level", 1 },
			{ "gold", 20000000 },
		},
		races = {
			"Quara Plunderer",
			"Quara Raider",
			"Quara Looter",
		},
	},

	{
		name = "Oberon",
		category = 2,
		color = 40,
		total = 15,
		type = "repeatable",
		storage = 190078,
		storagecount = 190079,
		rewards = {
			{ "random", { 
				{ 28724, 1 }, 
				{ 28723, 1 },
				{ 28725, 1 },
				{ 28718, 1 },
				{ 28714, 1 },
				{ 28715, 1 },
				{ 28716, 1 },
				{ 28717, 1 },
				{ 28720, 1 },
				{ 28719, 1 },
				{ 50161, 1 },
			}},
			{ "level", 1 },
			{ "gold", 20000000 },
			{ 22721, 10 },
		},
		races = {
			"Grand Master Oberon",
		},
	},

	{
		name = "Drume",
		category = 2,
		color = 40,
		total = 15,
		type = "repeatable",
		storage = 190080,
		storagecount = 190081,
		rewards = {
			{ "random", {
				{ 34150, 1 }, 
				{ 34151, 1 },
				{ 34152, 1 },
				{ 34153, 1 },
				{ 34154, 1 },
				{ 34155, 1 },
				{ 34156, 1 },
				{ 34157, 1 },
				{ 34158, 1 },
				{ 34254, 1 },
				{ 34253, 1 },
				{ 50162, 1 },
			}},
			{ "level", 1 },
			{ "gold", 20000000 },
			{ 22721, 10 },
		},
		races = {
			"Drume",
		},
	},

	{
		name = "Magma Bubble",
		category = 2,
		color = 40,
		total = 15,
		type = "repeatable",
		storage = 190082,
		storagecount = 190083,
		rewards = {
			{ "random", {
				{ 39154, 1 }, -- arboreal tome
				{ 39153, 1 }, -- arboreal crown
				{ 39147, 1 }, -- spiritthorn armor
				{ 39148, 1 }, -- spiritthorn helmet
				{ 39149, 1 }, -- alicorn headguard
				{ 39150, 1 }, -- alicorn quiver
				{ 39151, 1 }, -- arcanomancer regalia
				{ 39152, 1 }, -- arcanomancer folio
				{ 39183, 1 }, -- charged arcanomancer sigil
				{ 39186, 1 }, -- charged arboreal ring
				{ 39180, 1 }, -- charged alicorn ring
				{ 39177, 1 }, -- charged spiritthorn ring
				{ 50147, 1 }, -- portable flame
				{ 50149, 1 }, -- ethereal ring
			}},
			{ "level", 1 },
			{ "gold", 20000000 },
			{ 22721, 10 },
		},
		races = {
			"Magma Bubble",
		},
	},

	{
		name = "King Zelos",
		category = 2,
		color = 40,
		total = 15,
		type = "repeatable",
		storage = 190084,
		storagecount = 190085,
		rewards = {
			{ "random", {
				{ 23535, 1 }, -- bow of cataclysm
				{ 23536, 1 }, -- galea mortis
				{ 23537, 1 }, -- death oyoroi
			}},
			{ "level", 1 },
			{ "gold", 20000000 },
			{ 22721, 10 },
		},
		races = {
			"King Zelos",
		},
	},

	{
		name = "Scarlett Etzel",
		category = 2,
		color = 40,
		total = 15,
		type = "repeatable",
		storage = 190086,
		storagecount = 190087,
		rewards = {
			{ "random", {
				{ 30393, 1 }, -- cobra crossbow
				{ 30395, 1 }, -- cobra club
				{ 30396, 1 }, -- cobra axe
				{ 30397, 1 }, -- cobra hood
				{ 30398, 1 }, -- cobra sword
				{ 30399, 1 }, -- cobra wand
				{ 30400, 1 }, -- cobra rod
				{ 50167, 1 }, -- cobra bo
			}},
			{ "level", 1 },
			{ "gold", 20000000 },
			{ 22721, 10 },
		},
		races = {
			"Scarlett Etzel",
		},
	},

	{
		name = "The Monster",
		category = 2,
		color = 40,
		total = 15,
		type = "repeatable",
		storage = 190088,
		storagecount = 190089,
		rewards = {
			{ "random", {
				{ 40588, 1 }, -- antler-horn helmet
				{ 40590, 1 }, -- mutated skin legs
				{ 40591, 1 }, -- mutated skin armor
				{ 40595, 1 }, -- mutant bone kilt
				{ 40589, 1 }, -- stitched mutant hide legs
				{ 40592, 1 }, -- alchemist's boots
				{ 40593, 1 }, -- mutant bone boots
				{ 40594, 1 }, -- alchemist's notepad
			}},
			{ "level", 1 },
			{ "gold", 20000000 },
			{ 22721, 10 },
		},
		races = {
			"The Monster",
		},
	},

	{
		name = "Soul War Bosses",
		category = 2,
		color = 40,
		total = 60,
		type = "repeatable",
		storage = 190090,
		storagecount = 190091,
		rewards = {
			{ 34109, 10 }, -- bag you desire
			{ "level", 1 },
			{ "gold", 20000000 },
			{ 22721, 10 },
		},
		races = {
			"goshnar's malice",
			"goshnar's spite",
			"goshnar's greed",
			"goshnar's hatred",
			"goshnar's cruelty",
			"goshnars megalomania",
		},
	},

	{
		name = "Sanguine Bosses",
		category = 2,
		color = 40,
		total = 50,
		type = "repeatable",
		storage = 190092,
		storagecount = 190093,
		rewards = {
			{ 43895, 10 }, -- bag you covet
			{ "level", 1 },
			{ "gold", 20000000 },
			{ 22721, 10 },
		},
		races = {
			"murcion",
			"ichgahal",
			"bakragore",
			"chagorz",
			"vemiath",
		},
	},

	{
		name = "The Scourge of Oblivion",
		category = 2,
		color = 40,
		total = 30,
		type = "repeatable",
		storage = 190094,
		storagecount = 190095,
		rewards = {
			{ 28791, 1 }, -- library ticket
			{ 8104, 1 }, -- calamity
			{ "level", 1 },
			{ "gold", 20000000 },
			{ 22721, 10 },
		},
		races = {
			"the scourge of oblivion",
		},
	},

	{
		name = "Timira the Many-Headed",
		category = 2,
		color = 40,
		total = 15,
		type = "repeatable",
		storage = 190096,
		storagecount = 190097,
		rewards = {
			{ "random", {
				{ 39160, 1 }, -- naga quiver
				{ 39155, 1 }, -- naga sword
				{ 39156, 1 }, -- naga axe
				{ 39157, 1 }, -- naga club
				{ 39162, 1 }, -- naga wand
				{ 39163, 1 }, -- naga rod
				{ 39159, 1 }, -- naga crossbow
				{ 50262, 1 }, -- naga tanko
				{ 50160, 1 }, -- naga katar
			}},
			{ "level", 1 },
			{ "gold", 20000000 },
			{ 22721, 10 },
		},
		races = {
			"timira the many-headed",
		},
	},

	{
		name = "Ratmiral Blackwhiskers",
		category = 2,
		color = 40,
		total = 15,
		type = "repeatable",
		storage = 190098,
		storagecount = 190099,
		rewards = {
			{ "random", {
				{ 35518, 1 }, -- jungle bow
				{ 35524, 1 }, -- jungle quiver
				{ 35514, 1 }, -- jungle flail
				{ 35521, 1 }, -- jungle rod
				{ 35522, 1 }, -- jungle wand
				{ 35519, 1 }, -- makeshift boots
				{ 35520, 1 }, -- make-do boots
			}},
			{ "level", 1 },
			{ "gold", 20000000 },
			{ 22721, 10 },
		},
		races = {
			"ratmiral blackwhiskers",
		},
	},

	{
		name = "The Brainstealer",
		category = 2,
		color = 40,
		total = 15,
		type = "repeatable",
		storage = 190100,
		storagecount = 190101,
		rewards = {
			{ "random", {
				{ 36667, 1 }, -- eldritch breeches
				{ 36670, 1 }, -- eldritch cowl
				{ 36671, 1 }, -- eldritch hood
				{ 36664, 1 }, -- eldritch bow
				{ 36668, 1 }, -- eldritch wand
				{ 36674, 1 }, -- eldritch rod
				{ 36663, 1 }, -- eldritch cuirass
				{ 36658, 1 }, -- gilded eldritch claymore
				{ 36660, 1 }, -- gilded eldritch warmace
				{ 36662, 1 }, -- gilded eldritch greataxe
				{ 36665, 1 }, -- gilded eldritch bow
				{ 36669, 1 }, -- gilded eldritch wand
				{ 36675, 1 }, -- gilded eldritch rod
				{ 50170, 1 }, -- gilded eldritch crescent moon spade
				{ 50169, 1 }, -- eldritch crescent moon spade
				{ 39182, 1 }, -- eldritch crystal
				{ 39183, 1 }, -- eldritch monk boots
			}},
			{ "level", 1 },
			{ "gold", 20000000 },
			{ 22721, 10 },
		},
		races = {
			"the brainstealer",
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
			tasks[#tasks + 1] = data.name
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

	-- Verifica se o jogador tem o buff de kills ativo e se a task é da categoria 1
	local TASK_KILL_BONUS_STORAGE = 65003
	local TASK_KILL_BONUS_EXPIRATION = 65004
	
	-- Verifica se o buff está ativo e não expirou
	if player:getStorageValue(TASK_KILL_BONUS_STORAGE) >= 1 then
		local expirationTime = player:getStorageValue(TASK_KILL_BONUS_EXPIRATION)
		if os.time() >= expirationTime then
			-- Buff expirou, remove o efeito
			player:setStorageValue(TASK_KILL_BONUS_STORAGE, -1)
			player:setStorageValue(TASK_KILL_BONUS_EXPIRATION, -1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "O efeito da pocao de tasks expirou!")
		elseif data.category == 1 then
			-- Buff ativo e não expirou, dobra as kills
			count = count * 2
		end
	end

	if kills + count >= data.total then
		if taskOptions.selectLanguage == 1 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, task_pt_br.messageCompleteTask)
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Task System] You have finished this task! To claim your rewards, return to the quest board and claim your reward.")
		end
		return player:setStorageValue(data.storagecount, data.total)
	end
	-- Verifica se o jogador desativou as mensagens de task antes de exibir
	local STORAGEVALUE_TASKLOG = 189999
	local taskLogState = player:getStorageValue(STORAGEVALUE_TASKLOG)
	if taskLogState ~= 1 then
		player:say("Task: " .. data.name .. " - [" .. kills + count .. "/" .. data.total .. "]", TALKTYPE_MONSTER_SAY)
	end

	return player:setStorageValue(data.storagecount, kills + count)
end
