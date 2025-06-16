-- lootshop_pricecache.lua
PRICE_BY_ID = {}
for _, v in ipairs(LootShopConfig) do
  PRICE_BY_ID[v.clientId] = v.sell
end

local royalFanfare = Action()
local ITEM_ROYAL_FANFARE = 2956
local ITEM_GOLD_POUCH   = 23721
local COOLDOWN_STORAGE  = 12345
local POUCH_UID_STORAGE = COOLDOWN_STORAGE + 1
local COOLDOWN_TIME     = 30        -- s

local function findLootPouch(player)
  local uid = player:getStorageValue(POUCH_UID_STORAGE)
  if uid > 0 then
    local c = Container(uid)
    if c and c:getId() == ITEM_GOLD_POUCH then return c end
  end
  for _, it in pairs(player:getStoreInbox():getItems()) do
    if it:getId() == ITEM_GOLD_POUCH then
      player:setStorageValue(POUCH_UID_STORAGE, it:getUniqueId())
      return Container(it:getUniqueId())
    end
  end
end

local function sellLootPouchItems(player)
  local now   = os.time()
  local last  = player:getStorageValue(COOLDOWN_STORAGE)
  if last > 0 and now - last < COOLDOWN_TIME then
    return player:sendCancelMessage(
      ("You must wait %d seconds."):format(COOLDOWN_TIME - (now - last)))
  end

  local pouch = findLootPouch(player)
  if not pouch then
    return player:sendCancelMessage("You do not have a Loot Pouch!")
  end

  local gold = 0
  for i = pouch:getSize() - 1, 0, -1 do
    local it    = pouch:getItem(i)
    local price = it and PRICE_BY_ID[it:getId()]
    if price then
      gold = gold + price * it:getCount()
      it:remove()
    end
  end

  if gold == 0 then
    return player:sendCancelMessage("No valid items to sell in your Loot Pouch.")
  end

  player:setBankBalance(player:getBankBalance() + gold)
  player:setStorageValue(COOLDOWN_STORAGE, now)
  player:sendTextMessage(MESSAGE_LOOK,
    ("You sold all items in your Loot Pouch for %d gold coins."):format(gold))
  return true
end

function royalFanfare.onUse(player, item, fromPos, target, toPos, isHotkey)
  return sellLootPouchItems(player)
end

royalFanfare:id(ITEM_ROYAL_FANFARE)
royalFanfare:register()
