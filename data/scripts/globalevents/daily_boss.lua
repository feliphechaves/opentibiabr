local config = {
    teleportId = 34111,
    days = {
        ["Monday"] = {
            bossName = 'Aries',
            bossPosition = Position(1185, 989, 6),
            teleportPosition = Position(32369, 32234, 7),
            destinationPosition = Position(1143, 988, 6)
        },
        ["Tuesday"] = {
            bossName = 'Aries',
            bossPosition = Position(1185, 989, 6),
            teleportPosition = Position(32369, 32234, 7),
            destinationPosition = Position(1143, 988, 6)
        },
        ["Wednesday"] = {
            bossName = 'Aries',
            bossPosition = Position(1185, 989, 6),
            teleportPosition = Position(32369, 32234, 7),
            destinationPosition = Position(1143, 988, 6)
        },
        ["Thursday"] = {
            bossName = 'Aries',
            bossPosition = Position(1185, 989, 6),
            teleportPosition = Position(32369, 32234, 7),
            destinationPosition = Position(1143, 988, 6)
        },
        ["Friday"] = {
            bossName = 'Aries',
            bossPosition = Position(1185, 989, 6),
            teleportPosition = Position(32369, 32234, 7),
            destinationPosition = Position(1143, 988, 6)
        },
        ["Saturday"] = {
            bossName = 'Aries',
            bossPosition = Position(1185, 989, 6),
            teleportPosition = Position(32369, 32234, 7),
            destinationPosition = Position(1143, 988, 6)
        },
        ["Sunday"] = {
            bossName = 'Aries',
            bossPosition = Position(1185, 989, 6),
            teleportPosition = Position(32369, 32234, 7),
            destinationPosition = Position(1143, 988, 6)
        }
    },
    spawnTime = '21:00:00'
}

local DailyBossRespawn = GlobalEvent("DailyBossRespawn")
function DailyBossRespawn.onTime(interval)
    local day = config.days[os.date("%A")]
    if day then
        local item = Game.createItem(config.teleportId, 1, day.teleportPosition)
        if item then
            if not item:isTeleport() then
                item:remove()
                return false
            end
            item:setDestination(day.destinationPosition)
        end
        addEvent(function()
            Game.createMonster(day.bossName, day.bossPosition, false, true)
            Game.broadcastMessage(day.bossName .. ' has appeared! Face the challenge if you dare!', MESSAGE_GAME_HIGHLIGHT)
        end, 5000)
    end
    return true
end

DailyBossRespawn:time(config.spawnTime)
DailyBossRespawn:register()

local DailyBossDeath = CreatureEvent("DailyBossDeath")
function DailyBossDeath.onDeath(creature)

    local bossName = creature:getName():lower()
	if bossName ~= "aries" then
		return false
	end

    local day = config.days[os.date("%A")]
    if day and bossName:lower() == day.bossName:lower() then
        local teleport = Tile(day.teleportPosition):getItemById(config.teleportId)
        if teleport then
            teleport:remove()
            Game.broadcastMessage(day.bossName .. " has been defeated! The teleport has disappeared.", MESSAGE_GAME_HIGHLIGHT)
        end
    end
    return true
end

DailyBossDeath:register()