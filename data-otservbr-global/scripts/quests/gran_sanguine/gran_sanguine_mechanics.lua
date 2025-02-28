-- Configurações centralizadas
local Config = {
	SanguineEmber = {
		radius = 2,
		damageFactor = 0.15,
		effect = CONST_ME_FIREAREA,
	},
	SanguineFrost = {
		effect = CONST_ME_ICEAREA,
		rootDuration = 6, -- Duração do root em segundos
		rootEffect = CONST_ME_ICETORNADO,
		stepInActionId = 51111, -- Action ID único para o tile de root
		itemIdTile = 8426,
		damageFactor = 0.02,
	},
}

local sanguineEmberDeath = CreatureEvent("SanguineEmberDeath")

-- Função de explosão (Sanguine Ember)
function sanguineEmberDeath.onDeath(creature)
	local position = creature:getPosition()
	local settings = Config.SanguineEmber

	-- Explosão de fogo
	for x = -settings.radius, settings.radius do
		for y = -settings.radius, settings.radius do
			local targetPos = Position(position.x + x, position.y + y, position.z)
			if not Tile(targetPos):hasProperty(CONST_PROP_BLOCKSOLID) then
				targetPos:sendMagicEffect(settings.effect)
			end
		end
	end

	-- Aplicar dano em área
	for _, target in ipairs(Game.getSpectators(position, false, true, settings.radius, settings.radius, settings.radius, settings.radius)) do
		if target:isPlayer() then
			target:addHealth(-target:getHealth() * settings.damageFactor, settings.effect)
		end
	end
end

sanguineEmberDeath:register()

-- Evento de morte do Sanguine Frost
local sanguineFrostDeath = CreatureEvent("SanguineFrostDeath")

--[[
function sanguineFrostDeath.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)

    if not creature or not attacker then
		return primaryDamage, primaryType, secondaryDamage, secondaryType
	end

    local position = creature:getPosition()
    local settings = Config.SanguineFrost

    -- Criar efeito visual da morte
    position:sendMagicEffect(settings.effect)
    
    -- Criar um tile especial na posição com Action ID
    local tileItem = nil;
    local tile = Tile(position)
    if tile then
        if not tile:getItemById(settings.itemIdTile) then
            tileItem = Game.createItem(settings.itemIdTile, 1, position)
            tileItem:setActionId(settings.stepInActionId)
            addEvent(function() tileItem:remove() end, 30 * 1000)
        end
    end

    return primaryDamage, primaryType, secondaryDamage, secondaryType

end
]]

function sanguineFrostDeath.onDeath(creature)
	local position = creature:getPosition()
	local settings = Config.SanguineFrost

	-- Criar efeito visual da morte
	position:sendMagicEffect(settings.effect)

	-- Criar um tile especial na posição com Action ID
	local tileItem = nil
	local tile = Tile(position)
	if tile then
		if not tile:getItemById(settings.itemIdTile) then
			tileItem = Game.createItem(settings.itemIdTile, 1, position)
			tileItem:setActionId(settings.stepInActionId)
		end
	end

	if tileItem then
		-- Remover o tile após a duração do efeito
		addEvent(function()
			local item = Tile(position):getItemById(settings.itemIdTile)
			if item then
				item:remove()
			end
		end, 30 * 1000)
	end
end

sanguineFrostDeath:register()

-- Evento StepIn para aplicar condition paralyze
local frostTileStepIn = MoveEvent()

function frostTileStepIn.onStepIn(creature, item, position, fromPosition)
	local settings = Config.SanguineFrost
	if creature:isPlayer() then
		local condition = Condition(CONDITION_PARALYZE)
		condition:setParameter(CONDITION_PARAM_TICKS, Config.SanguineFrost.rootDuration * 1000)

		creature:addCondition(condition)
		creature:addHealth(-creature:getHealth() * settings.damageFactor, settings.effect)

		position:sendMagicEffect(Config.SanguineFrost.rootEffect)
	else
		local monster = creature:getMonster()
		if monster and monster:getName() == "Sanguine Frost" then
			local healAmount = math.random(15000, 20000)
			monster:addHealth(healAmount)
		end
	end

	if item then
		item:remove()
	end

	return true
end

frostTileStepIn:aid(Config.SanguineFrost.stepInActionId)
frostTileStepIn:register()

-- Função auxiliar para obter posições livres ao redor de uma base (raio configurável)
local function getFreePositionsAround(centerPos, radius)
	local positions = {}
	for x = -radius, radius do
		for y = -radius, radius do
			local tryPos = Position(centerPos.x + x, centerPos.y + y, centerPos.z)
			-- Verifica se o tile não é bloqueado
			if not Tile(tryPos):hasProperty(CONST_PROP_BLOCKSOLID) then
				table.insert(positions, tryPos)
			end
		end
	end
	return positions
end

local sanguineBoulderDeath = CreatureEvent("SanguineBoulderDeath")

function sanguineBoulderDeath.onDeath(creature)
	local position = creature:getPosition()

	-- Efeito visual (opcional) quando o Boulder morre
	position:sendMagicEffect(CONST_ME_GROUNDSHAKER)

	-- Chance de 30% de invocar os summons
	local chanceToSpawn = 30
	if math.random(100) > chanceToSpawn then
		return true
	end

	local summonsCount = 1
	local monsterName = "Boulder Elemental" -- Exemplo (sem XP e mais HP)
	local summonRadius = 1
	local despawnTime = 30 -- Tempo para sumir, em segundos
	local explosionRadius = 3 -- Raio da explosão final
	local finalExplosionEffect = CONST_ME_GREEN_RINGS -- Efeito da explosão

	-- Função auxiliar para pegar posições livres
	local function getFreePositionsAround(centerPos, radius)
		local positions = {}
		for x = -radius, radius do
			for y = -radius, radius do
				local tryPos = Position(centerPos.x + x, centerPos.y + y, centerPos.z)
				if not Tile(tryPos):hasProperty(CONST_PROP_BLOCKSOLID) then
					table.insert(positions, tryPos)
				end
			end
		end
		return positions
	end

	local freePositions = getFreePositionsAround(position, summonRadius)

	for i = 1, summonsCount do
		if #freePositions > 0 then
			local randIndex = math.random(#freePositions)
			local spawnPos = freePositions[randIndex]

			-- Cria o monstro
			local newMonster = Game.createMonster(monsterName, spawnPos, false, true)
			if newMonster then
				addEvent(function()
					-- Se o monstro ainda estiver vivo (não morto pelo player), ele será removido
					-- e causará dano em área.
					if newMonster and not newMonster:isRemoved() then
						local mPos = newMonster:getPosition()

						for x = -explosionRadius, explosionRadius do
							for y = -explosionRadius, explosionRadius do
								local tilePos = Position(mPos.x + x, mPos.y + y, mPos.z)
								if not Tile(tilePos):hasProperty(CONST_PROP_BLOCKSOLID) then
									tilePos:sendMagicEffect(finalExplosionEffect)
								end
							end
						end

						-- Pegar todos no raio de 'explosionRadius'
						for _, target in ipairs(Game.getSpectators(mPos, false, true, explosionRadius, explosionRadius, explosionRadius, explosionRadius)) do
							if target:isPlayer() then
								-- 30% da vida máxima do player
								local dmg = math.floor(target:getMaxHealth() * 0.3)
								-- Aplica dano (pode trocar o efeito abaixo)
								target:addHealth(-dmg, CONST_ME_EXPLOSIONHIT)
							end
						end

						-- Remove o monstro sem dar XP/loot
						newMonster:remove()
					end
				end, despawnTime * 1000)
			end

			table.remove(freePositions, randIndex)
		end
	end

	return true
end

sanguineBoulderDeath:register()

--------------------------------------------------------------------------------
-- Sanguine Spark Death (invoca 2 criaturas de Energia)
--------------------------------------------------------------------------------
local sanguineSparkDeath = CreatureEvent("SanguineSparkDeath")

function sanguineSparkDeath.onDeath(creature)
	local position = creature:getPosition()

	-- Efeito visual (opcional) quando o Spark morre
	position:sendMagicEffect(CONST_ME_GROUNDSHAKER)

	-- Chance de 30% de invocar os summons
	local chanceToSpawn = 30
	if math.random(100) > chanceToSpawn then
		return true
	end

	local summonsCount = 1
	local monsterName = "Spark Elemental" -- Exemplo (sem XP e mais HP)
	local summonRadius = 1
	local despawnTime = 30 -- Tempo para sumir, em segundos
	local explosionRadius = 3 -- Raio da explosão final
	local finalExplosionEffect = CONST_ME_ENERGYAREA -- Efeito da explosão

	-- Função auxiliar para pegar posições livres
	local function getFreePositionsAround(centerPos, radius)
		local positions = {}
		for x = -radius, radius do
			for y = -radius, radius do
				local tryPos = Position(centerPos.x + x, centerPos.y + y, centerPos.z)
				if not Tile(tryPos):hasProperty(CONST_PROP_BLOCKSOLID) then
					table.insert(positions, tryPos)
				end
			end
		end
		return positions
	end

	local freePositions = getFreePositionsAround(position, summonRadius)

	for i = 1, summonsCount do
		if #freePositions > 0 then
			local randIndex = math.random(#freePositions)
			local spawnPos = freePositions[randIndex]

			-- Cria o monstro
			local newMonster = Game.createMonster(monsterName, spawnPos, false, true)
			if newMonster then
				addEvent(function()
					-- Se o monstro ainda estiver vivo (não morto pelo player), ele será removido
					-- e causará dano em área.
					if newMonster and not newMonster:isRemoved() then
						local mPos = newMonster:getPosition()

						-- Explosão visual em toda a área do raio.
						for x = -explosionRadius, explosionRadius do
							for y = -explosionRadius, explosionRadius do
								local tilePos = Position(mPos.x + x, mPos.y + y, mPos.z)
								-- Se quiser evitar efeito em paredes, use a checagem:
								if not Tile(tilePos):hasProperty(CONST_PROP_BLOCKSOLID) then
									tilePos:sendMagicEffect(finalExplosionEffect)
									-- por ex. CONST_ME_BIGCLOUD, CONST_ME_EXPLOSIONAREA, etc.
								end
							end
						end

						-- Pegar todos no raio de 'explosionRadius'
						for _, target in ipairs(Game.getSpectators(mPos, false, true, explosionRadius, explosionRadius, explosionRadius, explosionRadius)) do
							if target:isPlayer() then
								-- 30% da vida máxima do player
								local dmg = math.floor(target:getMaxHealth() * 0.3)
								-- Aplica dano (pode trocar o efeito abaixo)
								target:addHealth(-dmg, CONST_ME_EXPLOSIONHIT)
							end
						end

						-- Remove o monstro sem dar XP/loot
						newMonster:remove()
					end
				end, despawnTime * 1000)
			end

			table.remove(freePositions, randIndex)
		end
	end

	return true
end

sanguineSparkDeath:register()
