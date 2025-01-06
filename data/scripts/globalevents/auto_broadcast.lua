local AutoBroadCast = GlobalEvent("text")
function AutoBroadCast.onThink(interval, lastExecution)
    local messages = {
    "[Daily Reward]: Using the !reward command you receive your daily reward",
    "[Tip]: Lagging? Use !fps to relog and get back to action!",
    "[Silver Tokens]: Looking to gather Dusts? Use a Silver Token to get 130 Dusts for 10kk (only 8kk if you're VIP)!",
    "[Gold Tokens]: Upgrade your gear! Exchange your Gold Tokens for Class 4 items with Goldoken. Don't miss the opportunity to get stronger!",
    "[Supreme Imbuements]: Maximize your power with Supreme Imbuements! They are stronger, last longer, and can be yours for Gold Tokens. Upgrade now and dominate the battlefield!",
    "[Daily Boss]: Ready for epic rewards? The Daily Boss spawns every day at 21:00! Find the teleport in the center of Thais temple and claim amazing loot.",
    "[Gold Transfer]: Need to send gold quickly? Use the command !transfer character, amount to transfer gold instantly, no need to visit the bank. Convenient and fast!",
    "[Task Sword]: Looking for exciting rewards? Interact with the sword in the Hunts Teleports room to start tasks and claim amazing prizes. Adventure awaits!",
    "[Boss Room]: Every boss in the Boss Room drops Gold Tokens! Challenge them, defeat them, and collect your rewards.",
    "[Bag You Covet]: Want a Bag You Covet? Defeat monsters in Rotten Blood and the new custom hunts to collect items. Trade them with Altar and claim your reward!",
    "[Grand Sanguine]: Did you know? Completing tasks in the new hunt can earn you a Grand Sanguine! Take on the challenge and claim this exclusive reward!",
    "[Bag You Desire]: Want to boost your chance of getting a Bag You Desire? Collect all 5 Taints to increase your odds. The more complete your set, the better your luck!",
    "[Check Taints]: Curious about your progress? Use the command !checktaint to see how many Taints you have collected. Keep striving for all 5!",
    "[Supreme Runes]: Unlock ultimate power with Supreme Runes! These powerful runes can be used by Druids and Sorcerers of level 1500+."
}
    Game.broadcastMessage(messages[math.random(#messages)], MESSAGE_GAME_HIGHLIGHT) 
    return true
end
AutoBroadCast:interval(900000)
AutoBroadCast:register()