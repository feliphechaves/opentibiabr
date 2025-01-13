local foods = {
	[49600] = { 30, "Gulp." }, -- egg
}

local food = Action()

function food.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local itemFood = foods[item.itemid]
	if not itemFood then
		return false
	end

	local condition = player:getCondition(CONDITION_REGENERATION, CONDITIONID_DEFAULT)
	if condition and math.floor(condition:getTicks() / 1000 + (itemFood[1] * 12)) >= 1200 then
		player:sendTextMessage(MESSAGE_FAILURE, "You are full.")
		return true
	end

	player:feed(itemFood[1] * 12)
	player:say(itemFood[2], TALKTYPE_MONSTER_SAY)

	player:getPosition():sendSingleSoundEffect(SOUND_EFFECT_TYPE_ACTION_EAT, player:isInGhostMode() and nil or player)
	return true
end

for index, value in pairs(foods) do
	food:id(index)
end

food:register()
