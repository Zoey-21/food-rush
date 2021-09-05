extends Node2D


func _physics_process(delta):
	if Input.is_action_just_pressed("move_up"):
		get_tree().change_scene("res://Store.tscn")
