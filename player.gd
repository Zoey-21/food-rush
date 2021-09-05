extends KinematicBody2D

onready var global = get_node("/root/global")
var food = preload("res://food_in_cart.tscn")
onready var time = get_node("/root/timer")

var bread_sprite = preload("res://resorces/food/bread.png") 
var carrot_sprite = preload("res://resorces/food/carrot.png") 
var milk_sprite = preload("res://resorces/food/milk.png") 
var potato_sprite = preload("res://resorces/food/potato.png") 
var tomato_sprite = preload("res://resorces/food/tomato.png") 
var banana_sprite = preload("res://resorces/food/banana.png") 
onready var foth_sprite = $CanvasLayer/VBoxContainer/HBoxContainer/Sprite

var speed = 400
var turn = 2
var move = 0
var rotate = 0
var start = true
var num_food_in_cart = 0


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
		if Input.is_action_just_pressed("rot_left") or Input.is_action_pressed("rot_right") or Input.is_action_pressed("move_up") or Input.is_action_pressed("move_down"):
			if !$rolling.playing:
				$rolling.play()
		if move == 0 and rotate == 0:
			 $rolling.stop()

	rotation_degrees = rotation_degrees + (rotate * turn)
	move_and_slide(Vector2(0, move*speed).rotated(rotation))
	
func food_spawn(type):
	var food_inst = food.instance()
	food_inst.food_type = type
	food_inst.position.y = -35
	$food_in_cart.call_deferred("add_child",food_inst)

func restock():
	$restock.play()
	var shelfs = get_tree().get_nodes_in_group("shelf")
	for shelf in shelfs:
		shelf.spawn_food()

func _on_foth_timeout():
	$foth2.play()
	$foth_between.start()
	foth_sprite.visible = false
	global.foth = 10


func _on_foth_between_timeout():
	$foth2.play()
	$foth.start()
	foth_sprite.visible = true
	var food_type = randi() % 6
	match food_type:
		0:
			foth_sprite.texture = bread_sprite
			global.foth = 0
		1:
			foth_sprite.texture = carrot_sprite
			global.foth = 1
		2:
			foth_sprite.texture = milk_sprite
			global.foth = 2
		3:
			foth_sprite.texture = potato_sprite
			global.foth = 3
		4:
			foth_sprite.texture = tomato_sprite
			global.foth = 4
		5:
			foth_sprite.texture = banana_sprite
			global.foth = 5



func _on_Timer_timeout():
	restock()


func _on_bump_body_entered(body):
	if !body.is_in_group("food") and !$bump_sound.playing:
		$bump_sound.play()
