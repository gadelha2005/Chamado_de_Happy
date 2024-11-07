extends CharacterBody2D

class_name PlayerLevel

func _physics_process(delta):
	pass

func die():
	get_tree().reload_current_scene()
