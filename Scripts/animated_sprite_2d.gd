extends AnimatedSprite2D

class_name PlayerAnimatedSprite

func trigger_animation(velocity: Vector2, direction: int):

	if not get_parent().is_on_floor():
		play("jump")
		
	else:
		if scale.x == 1 && sign(velocity.x) == -1:
			scale.x = -1
		elif scale.x == -1 && sign(velocity.x) == 1:
			scale.x = 1
		if velocity.x != 0:
			play("walk")
		else:
			play("idle")
