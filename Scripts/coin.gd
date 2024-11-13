extends Area2D

var coins = 0

@onready var ui: UI

func _on_body_entered(body):
	if (body is PlayerLevel): # substitua "Player" pelo nome real do seu personagem
		queue_free()
	
		
