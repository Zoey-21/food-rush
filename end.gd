extends Node2D

var minutes 
var seconds
onready var global = get_node("/root/global")

func _ready():
	$num.text = String(global.foods_collected[0])
	$num2.text = String(global.foods_collected[1])
	$num3.text = String(global.foods_collected[2])
	$num4.text = String(global.foods_collected[3])
	$num5.text = String(global.foods_collected[4])
	$num6.text = String(global.foods_collected[5])
	global.foods_collected = [0,0,0,0,0,0]
	minutes = String(int(global.get_time_played())/60)
	seconds = int(global.get_time_played())%60
	if seconds < 10: seconds = "0" + String(seconds) 
	else: seconds = String(seconds)
	$num8.text = minutes + ":" + seconds

func _physics_process(delta):
	if Input.is_action_just_pressed("move_up"):
		get_tree().change_scene("res://main_menu.tscn")


