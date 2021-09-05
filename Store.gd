extends Node2D

onready var time = get_node("/root/timer")
onready var global = get_node("/root/global")

func _ready():
	time.start()
	global.reset_time_played()

