extends Node

@onready var button_1 = get_node("Button1/AnimatedSpriteButton")
@onready var button_2 = get_node("Button2/AnimatedSpriteButton")
@onready var door = get_node("Door/AnimatedSpriteDoor")
@onready var ui = $UI
@onready var coin = $Coins/Coin


var button_1_pressed = false
var button_2_pressed = false

func _on_button_1_body_entered(body):
	if (body is PlayerLevel):
		button_1.play("buttonPressed")
		button_1_pressed = true
		openTheDoor()


func _on_button_2_body_entered(body):
	if (body is PlayerLevel):
		button_2.play("buttonPressed")
		button_2_pressed = true
		openTheDoor()

func openTheDoor():
	if button_1_pressed == true && button_2_pressed == true:
		door.play("doorOpen")
		

func get_coin():
	coin.connect("coin_collected" , ui ,  1)
