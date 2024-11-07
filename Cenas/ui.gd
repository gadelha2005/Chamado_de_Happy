extends Node

var coin_count = 0  # Variável para contar as moedas
@onready var coin_label = $CanvasLayer/CoinLabel

func update_coin_count():
	coin_count += 1
	coin_label.text = "Coins = " + str(coin_count)
