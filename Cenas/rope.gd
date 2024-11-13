extends Area2D


# Sinal para informar quando o player pode escalar a corda
signal rope_interact_start
signal rope_interact_end


func _on_body_entered(body):
	if (body is PlayerLevel):
		emit_signal("rope_interact_start", body)


func _on_body_exited(body):
	if (body is PlayerLevel):
		emit_signal("rope_interact_end", body)
