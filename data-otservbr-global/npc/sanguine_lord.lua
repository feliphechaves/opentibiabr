local internalNpcName = "Sanguine Lord"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 0
npcConfig.walkRadius = 0

npcConfig.outfit = {
	lookTypeEx = 8326,
}

npcConfig.flags = {
	floorchange = false,
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

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	message = message:lower()
	if MsgContains(message, "kneel") then
		npcHandler:say("Kneeling before my presence, do you dare to {offer} something? Choose your words wisely, for my patience is limited.", npc, creature)
		npcHandler:setTopic(playerId, 1)
	elseif MsgContains(message, "offer") and npcHandler:getTopic(playerId) == 1 then
		npcHandler:say("Three essences of life and 300 million gold coins... Only with this sacrifice will you prove your worth. Are you prepared to forsake what is mortal in exchange for power?", npc, creature)
		npcHandler:setTopic(playerId, 2)
	elseif MsgContains(message, "yes") and npcHandler:getTopic(playerId) == 2 then
		npcHandler:setTopic(playerId, 0)
		if player:getItemCount(65020) < 3 then
			npcHandler:say("You dare to deceive me? Return only when you possess all the required items, wretched fool!", npc, creature)
			return true
		end

		if not player:removeMoneyBank(300000000) then
			npcHandler:say("The gold is insufficient! Come back when you have the 300 million, little fool.", npc, creature)
			return true
		end

		if player:removeItem(65020, 3) then
			player:addItem(GRAND_SANGUINE_BAG, 1)
			player:addHealth(-player:getHealth() + 1)
			player:addMana(-player:getMana() + 1)
			player:getPosition():sendMagicEffect(CONST_ME_DRAWBLOOD)
			npcHandler:say("The sacrifice has been accepted, mortal. Now carry this gift with pride... and terror. HAHAHA!", npc, creature)
		end
	elseif MsgContains(message, "no") and npcHandler:getTopic(playerId) == 2 then
		npcHandler:setTopic(playerId, 0)
		local damage = player:getHealth() * 0.1 -- Deals 10% of the player's current health, minimum 50 damage
		player:addHealth(-damage)
		player:getPosition():sendMagicEffect(CONST_ME_MORTAREA)
		npcHandler:say("You dare waste my time?! Feel the wrath of the Sanguine Lord, insignificant worm!", npc, creature)
	end

	return true
end

npcHandler:setMessage(MESSAGE_GREET, "YOU! {Kneel} before the mighty Sanguine Lord, mortal! Declare your purpose with respect.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Flee, fragile creature, before the wrath of the sanguine consumes you.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Leave this place, |PLAYERNAME|. The grace of the Sanguine shall not be wasted on the faint-hearted.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcType:register(npcConfig)
