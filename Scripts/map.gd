extends Node

var in_area = false
@onready var level_1_pop_up = $"Level1 PopUp"
@onready var color_rect = $ColorRect



# Called when the node enters the scene tree for the first time.
func _ready():
	level_1_pop_up.visible = false # Replace with function body.
	


func _on_area_2d_area_entered(area):
	level_1_pop_up.visible = true
	in_area = true

		
func _on_area_2d_area_exited(area):
	level_1_pop_up.visible = false
	in_area = false

func _process(delta):
	if in_area and Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file("res://Cenas/level_1.tscn")
