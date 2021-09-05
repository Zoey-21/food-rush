extends Node2D


onready var global = get_node("/root/global")

func _ready():
	$num.text = String(global.foods_collected[0])
	$num2.text = String(global.foods_collected[1])
	$num3.text = String(global.foods_collected[2])
	$num4.text = String(global.foods_collected[3])
	$num5.text = String(global.foods_collected[4])
	$num6.text = String(global.foods_collected[5])
	global.foods_collected = [0,0,0,0,0,0]

func _physics_process(delta):
	if Input.is_action_just_pressed("move_up"):
		get_tree().change_scene("res://main_menu.tscn")
