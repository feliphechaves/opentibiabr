local table = {
  --sorcerer e master sorcerer
  [{1, 5}] = {
    [150] = {items = {{itemid = 645, count = 1}, {itemid = 20088, count = 1}, {itemid = 14086, count = 1},
                    {itemid = 8864, count = 1}, {itemid = 27457, count = 1}, {itemid = 3079, count = 1} },
    storage = 40100, msg = "You won equipments for reaching level 150!"},
  },
  --druid e elder druid
  [{2, 6}] = {
    [150] = {items = {{itemid = 645, count = 1}, {itemid = 20088, count = 1}, {itemid = 14086, count = 1},
                     {itemid = 8864, count = 1}, {itemid = 27458, count = 1}, {itemid = 3079, count = 1} },
    storage = 40200, msg = "You won equipments for reaching level 150!"},
  },
  --paladin e royal paladin
  [{3, 7}] = {
    [150] = {items = {{itemid = 10385, count = 1}, {itemid = 16110, count = 1}, {itemid = 16111, count = 1},
                     {itemid = 27455, count = 1}, {itemid = 27456, count = 1}, {itemid = 3079, count = 1} },
    storage = 40300, msg = "You won equipments for reaching level 150!"},
  },
  --knight e elite knight
  [{4, 8}] = {
    [150] = {items = {{itemid = 10385, count = 1}, {itemid = 16110, count = 1}, {itemid = 10387, count = 1},
                     {itemid = 27451, count = 1}, {itemid = 27453, count = 1}, {itemid = 27449, count = 1},
                     {itemid = 16116, count = 1},  {itemid = 3079, count = 1} },
    storage = 40300, msg = "You won equipments for reaching level 150!"},
  }
}

local rewardLevel = CreatureEvent("RewardLevel")
function rewardLevel.onAdvance(player, skill, oldLevel, newLevel)

    if skill ~= SKILL_LEVEL or newLevel <= oldLevel then
        return true
    end

    for voc, x in pairs(table) do
      if isInArray(voc, player:getVocation():getId()) then
        for level, z in pairs(x) do
          if newLevel >= level and player:getStorageValue(z.storage) ~= 1 then
              local backpack = player:addItem(10327)
              if not backpack then
                return true
              end
              for v = 1, #z.items do
                backpack:addItem(z.items[v].itemid, z.items[v].count)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, z.msg)
                player:setStorageValue(z.storage, 1)
              end
          end
        end
        player:save()
        return true
      end
    end
end

rewardLevel:register()