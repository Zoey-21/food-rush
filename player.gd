extends KinematicBody2D

onready var global = get_node("/root/global")
var food = preload("res://food_in_cart.tscn")

var speed = 200
var turn = 2
var move = 0
var rotate = 0
var start = true



func _physics_process(delta):
	if Input.is_action_just_pressed("fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
	move = 0
	rotate = 0
	if start:
		if Input.is_action_pressed("rot_left"):
			rotate = -1
		if Input.is_action_pressed("rot_right"):
			rotate = 1
		if Input.is_action_pressed("move_up"):
			move = -1
		if Input.is_action_pressed("move_down"):
			move = 1
	if Input.is_action_pressed("run"):
		speed = 400
	else:
		speed = 200

	rotation_degrees = rotation_degrees + (rotate * turn)
	move_and_slide(Vector2(0, move*speed).rotated(rotation))
	
func food_spawn(type):
	var food_inst = food.instance()
	food_inst.food_type = type
	food_inst.position.y = -35
	$food_in_cart.add_child(food_inst)
