local AutoBroadCast = GlobalEvent("text")
function AutoBroadCast.onThink(interval, lastExecution)
	local messages = {
		"[Recompensa Diária]: Use o comando !reward para receber sua recompensa diária!",
		"[Dica]: Use !fps para relogar e limpar o cache do client melhorando o fps.",
		"[Dica]: Quando estiver caçando sempre deixe a Loot Pouch fechada para evitar lag.",
		"[Silver Tokens]: Use um Silver Token e receba 130 Dusts por 10kk (ou 8kk se for VIP)!",
		"[Gold Tokens]: Troque Gold Tokens por itens classe 4 com o NPC Goldoken.",
		"[Imbuements Supreme]: Supreme Imbuements são mais fortes e duram mais. Eles precisam apenas de Gold Tokens.",
		"[Boss Diário]: O Boss Diário aparece todos os dias às 20:00! O teleporte fica disponível no centro do templo de Thais.",
		"[Boss Diário]: Nos domingos o boss diário é o Ferumbras!",
		"[Boss Diário]: Nas sextas o boss diário é o Morshabaal!",
		"[Transferência de Gold]: Use o comando !transfer [nome], [valor] (sem colchetes) para transferir gold para outro personagem.",
		"[Sala de Boss]: Todos os bosses na Sala de Boss dropam Gold Tokens!",
		"[Bag You Covet]: Troque 5 tainted heart e 5 darklight heart com o Altar por uma Bag You Covet.",
		"[Grand Sanguine]: Você pode trocar 3 essence of health por uma Grand Sanguine Box com o Sanguine Lord que fica na sala de Hunts.",
		"[Verificar Taints]: Use o comando !checktaint para ver quantas Taints da soul war você já coletou!",
		"[Runas Supreme]: Desperte seu verdadeiro poder com Supreme Runes! Usáveis por Druids e Sorcerers com level 1500 ou mais.",
		"[Regra de Conta]: Máximo de 2 personagens por conta logados ao mesmo tempo, mas apenas 1 pode estar fora do PZ.",
	}
	Game.broadcastMessage(messages[math.random(#messages)], MESSAGE_GAME_HIGHLIGHT)
	return true
end
AutoBroadCast:interval(900000)
AutoBroadCast:register()