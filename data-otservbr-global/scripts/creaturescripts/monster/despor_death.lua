local desporDeath = CreatureEvent("DesporDeath")

function desporDeath.onDeath(creature, corpse, killer, mostDamageKiller, lastHitUnjustified, mostDamageUnjustified)
    if not creature or not creature:getMonster() then
        return true
    end

    onDeathForDamagingPlayers(creature, function(creature, player)
        if not player:hasOutfit(1722) and not player:hasOutfit(1723) then
            player:addOutfit(1722, 0)
            player:addOutfit(1723, 0)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations! You received the Draccoon Herald outfit.")
            player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
        end
    end)
    return true
end

desporDeath:register() 