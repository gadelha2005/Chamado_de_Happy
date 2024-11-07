extends Node

@onready var main = $Main
@onready var creditos = $Creditos
@onready var backButton = $"Voltar dos Creditos"
func _ready():
	creditos.visible = false
	backButton.visible = false



func _process(delta):
	pass


func _on_jogar_pressed():
	get_tree().change_scene_to_file("res://Cenas/map.tscn")


func _on_creditos_buttons_pressed():
	main.visible = false
	creditos.visible = true
	backButton.visible = true


func _on_voltar_dos_creditos_pressed():
	main.visible = true
	creditos.visible = false
	backButton.visible = false
	
