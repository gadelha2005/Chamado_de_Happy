extends Area2D

class_name Player

@onready var animation_player = %AnimatedSprite2D
var speed = 150
 
var last_direction

func _physics_process(delta):
	var input_vector = Vector2()
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	if input_vector != Vector2.ZERO:
		if input_vector.x < 0:
			last_direction = "left"
		elif input_vector.x > 0:
			last_direction = "right"
		
		if input_vector.y < 0:
			last_direction = "up"
		elif input_vector.y > 0:
			last_direction = "down"

		input_vector = input_vector.normalized()
		var velocity = input_vector * speed
		position += velocity * delta
		
		
		if input_vector.y > 0:
			animation_player.play("Front Walk")
		elif input_vector.y < 0:
			animation_player.play("Back Walk")
		elif input_vector.x > 0:
			animation_player.play("Right Walk")
		else:
			animation_player.play("Left Walk")
	else:
		match last_direction:
			"up":
				animation_player.play("Back Idle")
			"down":
				animation_player.play("Front Idle")
			"left":
				animation_player.play("Left Idle")
			"right":
				animation_player.play("Right Idle")
	
