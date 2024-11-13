extends Node

class_name UI

var coin_count = 0

@onready var coin_counter_label = $UI/Label  # Ajuste o caminho para o Label correto

func _ready():
	# Adiciona o node a um grupo "ui" para receber o sinal da moeda
	add_to_group("ui")

# Função chamada quando uma moeda é coletada
func on_coin_collected():
	# Incrementa o contador de moedas
	coin_count += 1
	# Atualiza o texto do Label para exibir o número de moedas coletadas
	coin_counter_label.text = str(coin_count)
