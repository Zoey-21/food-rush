extends Node2D

onready var time = get_node("/root/timer")

func _ready():
	time.start()

