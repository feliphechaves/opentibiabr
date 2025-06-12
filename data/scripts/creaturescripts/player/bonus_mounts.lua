-- bonus_mounts.lua
-- Bônus permanente baseado na quantidade de montarias que o personagem possui.
-- A cada montaria: +10 HP e +10 Mana

-----------------------------------------------------------------
-- Constantes
-----------------------------------------------------------------
local STAT_HP     = CONDITION_PARAM_STAT_MAXHITPOINTS   -- +HP
local STAT_MANA   = CONDITION_PARAM_STAT_MAXMANAPOINTS  -- +Mana
local CONDITION_SUBID = 78     -- identificador exclusivo da condição

-----------------------------------------------------------------
-- Configuração
-----------------------------------------------------------------
local MOUNTS_POR_NIVEL = 3      -- a cada 1 montaria → +10 HP/Mana
local MAX_BONUS       = 10000    -- limite superior

-----------------------------------------------------------------
-- Evento de login
-----------------------------------------------------------------
local addMountBonus = CreatureEvent("MountBonus")

function addMountBonus.onLogin(player)
    if not player:isVip() then
        return true -- só aplica se for premium
    end

    local mountCount = 0

    -- 1. Conta as montarias
    for i = 1, 247 do -- Número total de montarias no mounts.xml
        if player:hasMount(i) then
            mountCount = mountCount + 1
        end
    end

    -- 2. Calcula o bônus
    local bonus = math.min(mountCount * MOUNTS_POR_NIVEL, MAX_BONUS)

    -- 3. Remove condição antiga (evita empilhar)
    player:removeCondition(CONDITION_ATTRIBUTES, CONDITIONID_DEFAULT, CONDITION_SUBID)

    if bonus < 1 then
        return true -- nada a aplicar
    end

    -- 4. Aplica a nova condição
    local cond = Condition(CONDITION_ATTRIBUTES, CONDITIONID_DEFAULT)
    cond:setParameter(CONDITION_PARAM_TICKS, -1)          -- permanente
    cond:setParameter(CONDITION_PARAM_SUBID, CONDITION_SUBID)

    -- Aplica bônus de HP e Mana
    cond:setParameter(STAT_HP, bonus * 10)    -- +10 HP por montaria
    cond:setParameter(STAT_MANA, bonus * 10)  -- +10 Mana por montaria

    player:addCondition(cond)

    -- 5. Feedback ao jogador
    player:sendTextMessage(
        MESSAGE_EVENT_ADVANCE,
        string.format(
            "Voce possui %d montarias e recebeu +%d HP e +%d Mana.",
            mountCount, bonus * 10, bonus * 10
        )
    )
    return true
end

addMountBonus:register() 