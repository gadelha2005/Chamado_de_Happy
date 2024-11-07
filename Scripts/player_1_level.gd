extends PlayerLevel

class_name PlayerLevel1

const SPEED = 100.0
const JUMP_VELOCITY = -300
const SLIDE_THRESHOLD = 0.6981  # Ângulo limite para deslizar
const SLIDE_FORCE = 50.0  # Força de deslizamento
const SLIDE_SMOOTHNESS = 0.1  # Controle de suavidade do deslizamento

@onready var AnimatedSprite = $AnimatedSprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
 
func _physics_process(delta):
	# Adiciona a gravidade
	if not is_on_floor():
		velocity.y += gravity * delta

	var floor_normal = get_floor_normal()
	var floor_angle = floor_normal.angle()
	
	# Aplica força de deslizamento em inclinações acentuadas usando `lerpf` para suavizar
	if abs(floor_angle) > SLIDE_THRESHOLD and is_on_floor():
		var slide_velocity = floor_normal.x * SLIDE_FORCE
		velocity.x = lerpf(velocity.x, slide_velocity, SLIDE_SMOOTHNESS)
	else:
		# Suaviza desaceleração para zero em terrenos menos inclinados
		velocity.x = lerpf(velocity.x, 0, SLIDE_SMOOTHNESS)
	
	# Manipula o pulo
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Obtém a direção de entrada e aplica movimento/suavização
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * delta)

	# Move o personagem e chama a animação
	move_and_slide()
	trigger_animation(velocity)

func trigger_animation(velocity: Vector2):
	# Animação de pulo
	if not is_on_floor():
		AnimatedSprite.play("jump")
		AnimatedSprite.flip_h = velocity.x < 0
	else:
		# Ajusta a direção da escala (virar sprite)
		if velocity.x != 0:
			AnimatedSprite.play("walk")
			AnimatedSprite.flip_h = velocity.x < 0
		else:
			AnimatedSprite.play("idle")
