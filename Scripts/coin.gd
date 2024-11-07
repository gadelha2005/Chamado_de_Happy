extends Area2D

signal coin_collected  # Sinal para notificar que a moeda foi coletada

@onready var coin = $"."


func _on_body_entered(body):
	if (body is PlayerLevel):
		emit_signal("coin_collected")
		queue_free()
