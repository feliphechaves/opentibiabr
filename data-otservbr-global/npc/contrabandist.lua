local internalNpcName = "Contrabandist"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 667,
	lookHead = 100,
	lookBody = 100,
	lookLegs = 119,
	lookFeet = 115,
	lookAddons = 3,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.shop = {

	--class 3
	{ itemName = "great axe", clientId = 3303, sell = 3000000 },
	{ itemName = "silver mace", clientId = 3312, sell = 3000000 },
	{ itemName = "ravager's axe", clientId = 3331, sell = 3000000 },
	{ itemName = "pharaoh sword", clientId = 3334, sell = 3000000 },
	{ itemName = "twin axe", clientId = 3335, sell = 3000000 },
	{ itemName = "djinn blade", clientId = 3339, sell = 3000000 },
	{ itemName = "dwarven helmet", clientId = 3396, sell = 3000000 },
	{ itemName = "dwarven armor", clientId = 3397, sell = 3000000 },
	{ itemName = "dwarven legs", clientId = 3398, sell = 3000000 },
	{ itemName = "elven mail", clientId = 3399, sell = 3000000 },
	{ itemName = "dragon scale helmet", clientId = 3400, sell = 3000000 },
	{ itemName = "elven legs", clientId = 3401, sell = 3000000 },
	{ itemName = "magician hat", clientId = 3573, sell = 3000000 },
	{ itemName = "Ron the Ripper's sabre", clientId = 6101, sell = 3000000 },
	{ itemName = "havoc blade", clientId = 7405, sell = 3000000 },
	{ itemName = "queen's sceptre", clientId = 7410, sell = 3000000 },
	{ itemName = "reaper's axe", clientId = 7420, sell = 3000000 },
	{ itemName = "skullcrusher", clientId = 7423, sell = 3000000 },
	{ itemName = "demonbone", clientId = 7431, sell = 3000000 },
	{ itemName = "impaler", clientId = 7435, sell = 3000000 },
	{ itemName = "executioner", clientId = 7453, sell = 3000000 },
	{ itemName = "fur cap", clientId = 7458, sell = 3000000 },
	{ itemName = "royal crossbow", clientId = 8023, sell = 3000000 },
	{ itemName = "warsinger bow", clientId = 8026, sell = 3000000 },
	{ itemName = "master archer's armor", clientId = 8060, sell = 3000000 },
	{ itemName = "hellforged axe", clientId = 8096, sell = 3000000 },
	{ itemName = "demonwing axe", clientId = 8098, sell = 3000000 },
	{ itemName = "obsidian truncheon", clientId = 8100, sell = 3000000 },
	{ itemName = "emerald sword", clientId = 8102, sell = 3000000 },
	{ itemName = "royal draken mail", clientId = 11686, sell = 3000000 },
	{ itemName = "royal scale robe", clientId = 11687, sell = 3000000 },
	{ itemName = "elite draken helmet", clientId = 11689, sell = 3000000 },
	{ itemName = "snake god's sceptre", clientId = 11692, sell = 3000000 },
	{ itemName = "old cape", clientId = 11701, sell = 3000000 },
	{ itemName = "thorn spitter", clientId = 14768, sell = 3000000 },
	{ itemName = "albino plate", clientId = 19358, sell = 3000000 },
	{ itemName = "goo shell", clientId = 19372, sell = 3000000 },
	{ itemName = "umbral blade", clientId = 20065, sell = 3000000 },
	{ itemName = "umbral slayer", clientId = 20068, sell = 3000000 },
	{ itemName = "umbral axe", clientId = 20071, sell = 3000000 },
	{ itemName = "umbral chopper", clientId = 20074, sell = 3000000 },
	{ itemName = "umbral mace", clientId = 20077, sell = 3000000 },
	{ itemName = "umbral hammer", clientId = 20080, sell = 3000000 },
	{ itemName = "umbral bow", clientId = 20083, sell = 3000000 },
	{ itemName = "umbral crossbow", clientId = 20086, sell = 3000000 },
	{ itemName = "maimer", clientId = 22762, sell = 3000000 },
	{ itemName = "gnome helmet", clientId = 27647, sell = 3000000 },
	{ itemName = "gnome armor", clientId = 27648, sell = 3000000 },
	{ itemName = "gnome legs", clientId = 27649, sell = 3000000 },
	{ itemName = "gnome sword", clientId = 27651, sell = 3000000 },
	{ itemName = "deepling ceremonial dagger", clientId = 28825, sell = 3000000 },
	{ itemName = "deepling fork", clientId = 28826, sell = 3000000 },
	{ itemName = "rotten demonbone", clientId = 28829, sell = 3000000 },
	{ itemName = "energized demonbone", clientId = 28830, sell = 3000000 },
	{ itemName = "unliving demonbone", clientId = 28831, sell = 3000000 },
	{ itemName = "sulphurous demonbone", clientId = 28832, sell = 3000000 },
	{ itemName = "living vine bow", clientId = 29417, sell = 3000000 },
	{ itemName = "living armor", clientId = 29418, sell = 3000000 },
	{ itemName = "resizer", clientId = 29419, sell = 3000000 },
	{ itemName = "summerblade", clientId = 29421, sell = 3000000 },
	{ itemName = "winterblade", clientId = 29422, sell = 3000000 },
	{ itemName = "dream shroud", clientId = 29423, sell = 3000000 },
	{ itemName = "energized limb", clientId = 29425, sell = 3000000 },
	{ itemName = "dark whispers", clientId = 29427, sell = 3000000 },
	{ itemName = "terra helmet", clientId = 31577, sell = 3000000 },
	{ itemName = "bear skin", clientId = 31578, sell = 3000000 },
	{ itemName = "embrace of nature", clientId = 31579, sell = 3000000 },
	{ itemName = "mortal mace", clientId = 31580, sell = 3000000 },
	{ itemName = "bow of cataclysm", clientId = 31581, sell = 3000000 },
	{ itemName = "galea mortis", clientId = 31582, sell = 3000000 },
	{ itemName = "toga mortis", clientId = 31583, sell = 3000000 },
	{ itemName = "phantasmal axe", clientId = 32616, sell = 3000000 },
	{ itemName = "fabulous legs", clientId = 32617, sell = 3000000 },
	{ itemName = "soulful legs", clientId = 32618, sell = 3000000 },
	{ itemName = "ghost chestplate", clientId = 32628, sell = 3000000 },
	{ itemName = "death oyoroi", clientId = 50260, sell = 3000000 },
	{ itemName = "jade legs", clientId = 50185, sell = 3000000 },
	{ itemName = "dark vision bandana", clientId = 50190, sell = 3000000 },

	--class 4
	{ itemName = "amazon helmet", clientId = 3393, sell = 10000000 },
	{ itemName = "amazon armor", clientId = 3394, sell = 10000000 },
	{ itemName = "alicorn headguard", clientId = 39149, sell = 10000000 },
	{ itemName = "arcanomancer regalia", clientId = 39151, sell = 10000000 },
	{ itemName = "arboreal crown", clientId = 39153, sell = 10000000 },
	{ itemName = "ethereal coned hat", clientId = 50188, sell = 5000000 },
	{ itemName = "antler-horn helmet", clientId = 40588, sell = 10000000 },
	{ itemName = "arcane dragon robe", clientId = 44623, sell = 10000000 },
	{ itemName = "chain bolter", clientId = 8022, sell = 10000000 },
	{ itemName = "cobra crossbow", clientId = 30393, sell = 10000000 },
	{ itemName = "cobra club", clientId = 30395, sell = 10000000 },
	{ itemName = "cobra axe", clientId = 30396, sell = 10000000 },
	{ itemName = "cobra hood", clientId = 30397, sell = 10000000 },
	{ itemName = "cobra sword", clientId = 30398, sell = 10000000 },
	{ itemName = "cobra wand", clientId = 30399, sell = 10000000 },
	{ itemName = "cobra rod", clientId = 30400, sell = 10000000 },
	{ itemName = "bast legs", clientId = 35517, sell = 10000000 },
	{ itemName = "daramian axe", clientId = 3329, sell = 10000000 },
	{ itemName = "dragon scale legs", clientId = 3363, sell = 10000000 },
	{ itemName = "demon legs", clientId = 3389, sell = 10000000 },
	{ itemName = "elethriel's elemental bow", clientId = 8030, sell = 10000000 },
	{ itemName = "dark lord's cape", clientId = 8037, sell = 10000000 },
	{ itemName = "earthborn titan armor", clientId = 8054, sell = 10000000 },
	{ itemName = "dark trinity mace", clientId = 8099, sell = 10000000 },
	{ itemName = "exotic legs", clientId = 35516, sell = 10000000 },
	{ itemName = "eldritch claymore", clientId = 36657, sell = 10000000 },
	{ itemName = "eldritch warmace", clientId = 36659, sell = 10000000 },
	{ itemName = "eldritch greataxe", clientId = 36661, sell = 10000000 },
	{ itemName = "eldritch cuirass", clientId = 36663, sell = 10000000 },
	{ itemName = "eldritch bow", clientId = 36664, sell = 10000000 },
	{ itemName = "eldritch breeches", clientId = 36667, sell = 10000000 },
	{ itemName = "eldritch wand", clientId = 36668, sell = 10000000 },
	{ itemName = "eldritch cowl", clientId = 36670, sell = 10000000 },
	{ itemName = "eldritch hood", clientId = 36671, sell = 10000000 },
	{ itemName = "eldritch rod", clientId = 36674, sell = 10000000 },
	{ itemName = "dawnfire sherwani", clientId = 39164, sell = 10000000 },
	{ itemName = "dawnfire pantaloons", clientId = 39166, sell = 10000000 },
	{ itemName = "dauntless dragon scale armor", clientId = 44621, sell = 10000000 },
	{ itemName = "golden helmet", clientId = 3365, sell = 10000000 },
	{ itemName = "horned helmet", clientId = 3390, sell = 10000000 },
	{ itemName = "Ferumbras' hat", clientId = 5903, sell = 10000000 },
	{ itemName = "hammer of prophecy", clientId = 7450, sell = 10000000 },
	{ itemName = "icy culottes", clientId = 19366, sell = 10000000 },
	{ itemName = "furious frock", clientId = 19391, sell = 10000000 },
	{ itemName = "impaler of the igniter", clientId = 22760, sell = 10000000 },
	{ itemName = "falcon circlet", clientId = 28714, sell = 10000000 },
	{ itemName = "falcon coif", clientId = 28715, sell = 10000000 },
	{ itemName = "falcon rod", clientId = 28716, sell = 10000000 },
	{ itemName = "falcon wand", clientId = 28717, sell = 10000000 },
	{ itemName = "falcon bow", clientId = 28718, sell = 10000000 },
	{ itemName = "falcon plate", clientId = 28719, sell = 10000000 },
	{ itemName = "falcon greaves", clientId = 28720, sell = 10000000 },
	{ itemName = "falcon longsword", clientId = 28723, sell = 10000000 },
	{ itemName = "falcon battleaxe", clientId = 28724, sell = 10000000 },
	{ itemName = "falcon mace", clientId = 28725, sell = 10000000 },
	{ itemName = "gilded eldritch claymore", clientId = 36658, sell = 10000000 },
	{ itemName = "gilded eldritch warmace", clientId = 36660, sell = 10000000 },
	{ itemName = "gilded eldritch greataxe", clientId = 36662, sell = 10000000 },
	{ itemName = "gilded eldritch bow", clientId = 36665, sell = 10000000 },
	{ itemName = "gilded eldritch wand", clientId = 36669, sell = 10000000 },
	{ itemName = "gilded eldritch rod", clientId = 36675, sell = 10000000 },
	{ itemName = "grand sanguine blade", clientId = 43865, sell = 10000000 },
	{ itemName = "grand sanguine cudgel", clientId = 43867, sell = 10000000 },
	{ itemName = "grand sanguine hatchet", clientId = 43869, sell = 10000000 },
	{ itemName = "grand sanguine razor", clientId = 43871, sell = 10000000 },
	{ itemName = "grand sanguine bludgeon", clientId = 43873, sell = 10000000 },
	{ itemName = "grand sanguine battleaxe", clientId = 43875, sell = 10000000 },
	{ itemName = "grand sanguine bow", clientId = 43878, sell = 10000000 },
	{ itemName = "grand sanguine crossbow", clientId = 43880, sell = 10000000 },
	{ itemName = "grand sanguine coil", clientId = 43883, sell = 10000000 },
	{ itemName = "grand sanguine rod", clientId = 43886, sell = 10000000 },
	{ itemName = "magic longsword", clientId = 3278, sell = 10000000 },
	{ itemName = "light mace", clientId = 3325, sell = 10000000 },
	{ itemName = "lich staff", clientId = 3343, sell = 10000000 },
	{ itemName = "native armor", clientId = 3402, sell = 10000000 },
	{ itemName = "mythril axe", clientId = 7455, sell = 10000000 },
	{ itemName = "oceanborn leviathan armor", clientId = 8056, sell = 10000000 },
	{ itemName = "molten plate", clientId = 8058, sell = 10000000 },
	{ itemName = "mage's cap", clientId = 12599, sell = 10000000 },
	{ itemName = "one hit wonder", clientId = 21219, sell = 10000000 },
	{ itemName = "plague bite", clientId = 22759, sell = 10000000 },
	{ itemName = "lion longbow", clientId = 34150, sell = 10000000 },
	{ itemName = "lion rod", clientId = 34151, sell = 10000000 },
	{ itemName = "lion wand", clientId = 34152, sell = 10000000 },
	{ itemName = "lion longsword", clientId = 34155, sell = 10000000 },
	{ itemName = "lion spangenhelm", clientId = 34156, sell = 10000000 },
	{ itemName = "lion plate", clientId = 34157, sell = 10000000 },
	{ itemName = "lion axe", clientId = 34253, sell = 10000000 },
	{ itemName = "lion hammer", clientId = 34254, sell = 10000000 },
	{ itemName = "jungle flail", clientId = 35514, sell = 10000000 },
	{ itemName = "jungle bow", clientId = 35518, sell = 10000000 },
	{ itemName = "jungle rod", clientId = 35521, sell = 10000000 },
	{ itemName = "jungle wand", clientId = 35522, sell = 10000000 },
	{ itemName = "naga sword", clientId = 39155, sell = 10000000 },
	{ itemName = "naga axe", clientId = 39156, sell = 10000000 },
	{ itemName = "naga club", clientId = 39157, sell = 10000000 },
	{ itemName = "naga crossbow", clientId = 39159, sell = 10000000 },
	{ itemName = "naga wand", clientId = 39162, sell = 10000000 },
	{ itemName = "naga rod", clientId = 39163, sell = 10000000 },
	{ itemName = "midnight tunic", clientId = 39165, sell = 10000000 },
	{ itemName = "midnight sarong", clientId = 39167, sell = 10000000 },
	{ itemName = "mutated skin legs", clientId = 40590, sell = 10000000 },
	{ itemName = "mutated skin armor", clientId = 40591, sell = 10000000 },
	{ itemName = "mutant bone kilt", clientId = 40595, sell = 10000000 },
	{ itemName = "mystical dragon robe", clientId = 44624, sell = 10000000 },
	{ itemName = "ravenwing", clientId = 7433, sell = 10000000 },
	{ itemName = "robe of the ice queen", clientId = 8038, sell = 10000000 },
	{ itemName = "solar axe", clientId = 8097, sell = 10000000 },
	{ itemName = "shroud of despair", clientId = 22757, sell = 10000000 },
	{ itemName = "soulcutter", clientId = 34082, sell = 10000000 },
	{ itemName = "soulshredder", clientId = 34083, sell = 10000000 },
	{ itemName = "soulbiter", clientId = 34084, sell = 10000000 },
	{ itemName = "soulcrusher", clientId = 34086, sell = 10000000 },
	{ itemName = "soulmaimer", clientId = 34087, sell = 10000000 },
	{ itemName = "soulbleeder", clientId = 34088, sell = 10000000 },
	{ itemName = "soulpiercer", clientId = 34089, sell = 10000000 },
	{ itemName = "soultainter", clientId = 34090, sell = 10000000 },
	{ itemName = "soulhexer", clientId = 34091, sell = 10000000 },
	{ itemName = "soulshanks", clientId = 34092, sell = 10000000 },
	{ itemName = "soulstrider", clientId = 34093, sell = 10000000 },
	{ itemName = "soulshell", clientId = 34094, sell = 10000000 },
	{ itemName = "soulmantle", clientId = 34095, sell = 10000000 },
	{ itemName = "soulshroud", clientId = 34096, sell = 10000000 },
	{ itemName = "souleater", clientId = 34085, sell = 10000000 },
	{ itemName = "spiritthorn armor", clientId = 39147, sell = 10000000 },
	{ itemName = "spiritthorn helmet", clientId = 39148, sell = 10000000 },
	{ itemName = "stitched mutant hide legs", clientId = 40589, sell = 10000000 },
	{ itemName = "sanguine blade", clientId = 43864, sell = 10000000 },
	{ itemName = "sanguine cudgel", clientId = 43866, sell = 10000000 },
	{ itemName = "sanguine hatchet", clientId = 43868, sell = 10000000 },
	{ itemName = "sanguine razor", clientId = 43870, sell = 10000000 },
	{ itemName = "sanguine bludgeon", clientId = 43872, sell = 10000000 },
	{ itemName = "sanguine battleaxe", clientId = 43874, sell = 10000000 },
	{ itemName = "sanguine legs", clientId = 43876, sell = 10000000 },
	{ itemName = "sanguine bow", clientId = 43877, sell = 10000000 },
	{ itemName = "sanguine crossbow", clientId = 43879, sell = 10000000 },
	{ itemName = "sanguine greaves", clientId = 43881, sell = 10000000 },
	{ itemName = "sanguine coil", clientId = 43882, sell = 10000000 },
	{ itemName = "sanguine rod", clientId = 43885, sell = 10000000 },
	{ itemName = "stoic iks cuirass", clientId = 44619, sell = 10000000 },
	{ itemName = "stoic iks chestplate", clientId = 44620, sell = 10000000 },
	{ itemName = "stoic iks casque", clientId = 44636, sell = 10000000 },
	{ itemName = "stoic iks headpiece", clientId = 44637, sell = 10000000 },
	{ itemName = "stoic iks culet", clientId = 44642, sell = 10000000 },
	{ itemName = "stoic iks faulds", clientId = 44643, sell = 10000000 },
	{ itemName = "thunder hammer", clientId = 3309, sell = 10000000 },
	{ itemName = "winged helmet", clientId = 3368, sell = 10000000 },
	{ itemName = "yol's bow", clientId = 8028, sell = 10000000 },
	{ itemName = "wand of dimensions", clientId = 12603, sell = 10000000 },
	{ itemName = "triple bolt crossbow", clientId = 19356, sell = 10000000 },
	{ itemName = "umbral masterblade", clientId = 20066, sell = 10000000 },
	{ itemName = "umbral master slayer", clientId = 20069, sell = 10000000 },
	{ itemName = "umbral master axe", clientId = 20072, sell = 10000000 },
	{ itemName = "umbral master chopper", clientId = 20075, sell = 10000000 },
	{ itemName = "umbral master mace", clientId = 20078, sell = 10000000 },
	{ itemName = "umbral master hammer", clientId = 20081, sell = 10000000 },
	{ itemName = "umbral master bow", clientId = 20084, sell = 10000000 },
	{ itemName = "umbral master crossbow", clientId = 20087, sell = 10000000 },
	{ itemName = "visage of the end days", clientId = 22754, sell = 10000000 },
	{ itemName = "throwing axe", clientId = 35515, sell = 10000000 },
	{ itemName = "unerring dragon scale armor", clientId = 44622, sell = 10000000 },
	{ itemName = "umbral master katar", clientId = 50165, sell = 10000000 },
	{ itemName = "gilded eldritch crescent moon spade", clientId = 50170, sell = 10000000 },
	{ itemName = "eldritch crescent moon spade", clientId = 50169, sell = 10000000 },
	{ itemName = "cobra bo", clientId = 50167, sell = 10000000 },
	{ itemName = "stoic iks robe", clientId = 50255, sell = 10000000 },
	{ itemName = "naga tanko", clientId = 50262, sell = 10000000 },
	{ itemName = "lion claws", clientId = 50162, sell = 10000000 },
	{ itemName = "naga katar", clientId = 50160, sell = 10000000 },
	{ itemName = "inferniarch claws", clientId = 50250, sell = 10000000 },
	{ itemName = "falcon sai", clientId = 50161, sell = 10000000 },
	{ itemName = "amber kusarigama", clientId = 50239, sell = 10000000 },
	{ itemName = "merudri battle mail", clientId = 50264, sell = 10000000 },
	{ itemName = "eldritch monk boots", clientId = 50266, sell = 5000000 },
	{ itemName = "mutant hide trousers", clientId = 50184, sell = 10000000 },
	{ itemName = "demon mengu", clientId = 50189, sell = 10000000 },
	{ itemName = "soulkamas", clientId = 50159, sell = 10000000 },
	{ itemName = "soulgarb", clientId = 50254, sell = 10000000 },
	{ itemName = "soulsoles", clientId = 50240, sell = 10000000 },
	{ itemName = "sanguine claws", clientId = 50157, sell = 10000000 },
	{ itemName = "grand sanguine claws", clientId = 50158, sell = 10000000 },
	{ itemName = "sanguine trousers", clientId = 50146, sell = 10000000 },

	--outros
	{ itemName = "alicorn quiver", clientId = 39150, sell = 5000000 },
	{ itemName = "sanguine galoshes", clientId = 43887, sell = 5000000 },
	{ itemName = "sanguine boots", clientId = 43884, sell = 5000000 },
	{ itemname = "pair of soulstalkers", clientid = 34098, sell = 500000 },
	{ itemname = "pair of soulwalkers", clientid = 34097, sell = 500000 },
	{ itemname = "frostflower boots", clientid = 39158, sell = 500000 },
	{ itemname = "feverbloom boots", clientid = 39161, sell = 500000 },
	{ itemname = "alchemist's boots", clientid = 40592, sell = 500000 },
	{ itemname = "mutant bone boots", clientid = 40593, sell = 500000 },
	{ itemname = "stoic iks boots", clientid = 44648, sell = 500000 },
	{ itemname = "stoic iks sandals", clientid = 44649, sell = 500000 },
	{ itemname = "umbral master spellbook", clientid = 20090, sell = 500000 },
	{ itemname = "gnome shield", clientid = 27650, sell = 500000 },
	{ itemname = "falcon shield", clientid = 28721, sell = 500000 },
	{ itemname = "falcon escutcheon", clientid = 28722, sell = 500000 },
	{ itemname = "soulbastion", clientid = 34099, sell = 500000 },
	{ itemname = "lion shield", clientid = 34154, sell = 500000 },
	{ itemname = "eldritch shield", clientid = 36656, sell = 500000 },
	{ itemname = "eldritch folio", clientid = 36672, sell = 500000 },
	{ itemname = "eldritch tome", clientid = 36673, sell = 500000 },
	{ itemname = "arcanomancer folio", clientid = 39152, sell = 500000 },
	{ itemname = "arboreal tome", clientid = 39154, sell = 500000 },
	{ itemname = "alchemist's notepad", clientid = 40594, sell = 500000 },
	{ itemname = "jungle quiver", clientid = 35524, sell = 10000000 },
	{ itemname = "eldritch quiver", clientid = 36666, sell = 10000000 },
	{ itemname = "naga quiver", clientid = 39160, sell = 10000000 },
	{ itemName = "iks footwraps", clientId = 50291, sell = 500000 },
	

	{ itemName = "charged arcanomancer sigil", clientId = 39183, sell = 5000000 },
	{ itemName = "charged arcanomancer sigil", clientId = 39184, sell = 5000000 },
	{ itemName = "arcanomancer sigil", clientId = 39185, sell = 5000000 },

	{ itemName = "charged alicorn ring", clientId = 39180, sell = 5000000 },
	{ itemName = "charged alicorn ring", clientId = 39181, sell = 5000000 },
	{ itemName = "alicorn ring", clientId = 39182, sell = 5000000 },

	{ itemName = "charged spiritthorn ring", clientId = 39177, sell = 5000000 },
	{ itemName = "charged spiritthorn ring", clientId = 39178, sell = 5000000 },
	{ itemName = "spiritthorn ring", clientId = 39179, sell = 5000000 },

	{ itemName = "charged arboreal ring", clientId = 39186, sell = 5000000 },
	{ itemName = "charged arboreal ring", clientId = 39187, sell = 5000000 },
	{ itemName = "arboreal ring", clientId = 39188, sell = 5000000 },

	{ itemName = "charged ethereal ring", clientId = 50147, sell = 5000000 },
	{ itemName = "charged ethereal ring", clientId = 50148, sell = 5000000 },
	{ itemName = "ethereal ring", clientId = 50149, sell = 5000000 },
	
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

local function greetCallback(npc, creature, message)
	local player = Player(creature)
	if not player:isVip() then
		npc:say("Quem mandou voce? Eu faco negocio com jogadores VIP. Saia antes que nos vejam conversando!", TALKTYPE_SAY, false, nil, player:getPosition())
		return false -- Bloqueia a interação
	end
	npcHandler:setInteraction(npc, creature)
	return true
end

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end
	return true
end

local function onTradeRequest(npc, creature)
	local player = Player(creature)
	if not player:isVip() then
		npc:say("Eu faco negocio com jogadores VIP. Sai fora...", TALKTYPE_SAY, false, nil, player:getPosition())
		return false -- Bloqueia a abertura da janela de trade
	end
	return true -- Permite a janela de trade
end

npcHandler:setMessage(MESSAGE_FAREWELL, "Bye!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Bye.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "At your service.")

npcHandler:setCallback(CALLBACK_ON_TRADE_REQUEST, onTradeRequest)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_TRADE, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType) end

npcType:register(npcConfig)
