local ferumbrasSoulSplinter = CreatureEvent("FerumbrasSoulSplinterDeath")

-- Configuração de área onde o Ferumbras Essence pode ser criado
local safeArea = {
    fromPosition = Position(33380, 31461, 14),
    toPosition = Position(33404, 31484, 14)
}

local function findFreePosition(preferredPosition, safeArea)
    -- Obtém a tile da posição preferida
    local preferredTile = Tile(preferredPosition)
    if preferredTile and preferredTile:isWalkable(false, false, false, true) and not preferredTile:getTopCreature() then
        return preferredPosition
    end

    -- Caso contrário, busca dentro da área configurada
    for x = safeArea.fromPosition.x, safeArea.toPosition.x do
        for y = safeArea.fromPosition.y, safeArea.toPosition.y do
            local pos = Position(x, y, safeArea.fromPosition.z)
            local tile = Tile(pos)
            if tile and tile:isWalkable(false, false, false, true) and not tile:getTopCreature() then
                return pos
            end
        end
    end

    -- Caso nenhuma posição válida seja encontrada
    return nil
end


function ferumbrasSoulSplinter.onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
    local position = creature:getPosition()
    local spawnPosition = findFreePosition(position, safeArea)

    if not spawnPosition then
        logger.info("[ferumbrasSoulSplinter.onDeath] No free position found for Ferumbras Essence.")
        return true
    end

    local monster = Game.createMonster("ferumbras essence", spawnPosition, true, true)
    if not monster then
        logger.info("[ferumbrasSoulSplinter.onDeath] Failed to create Ferumbras Essence at position {}", spawnPosition:toString())
    else
        logger.info("[ferumbrasSoulSplinter.onDeath] Ferumbras Essence created at position {}", spawnPosition:toString())
    end

    return true
end

ferumbrasSoulSplinter:register()

local ferumbrasEssenceImmortal = CreatureEvent("FerumbrasEssenceImmortal")
function ferumbrasEssenceImmortal.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    return 0, 0, 0, 0 -- Faz a essência ser imortal
end

ferumbrasEssenceImmortal:register()
