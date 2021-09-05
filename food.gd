extends Area2D

onready var global = get_node("/root/global")
export var food_type = 0

var bread_sprite = preload("res://resorces/food/bread.png") 
var carrot_sprite = preload("res://resorces/food/carrot.png") 
var milk_sprite = preload("res://resorces/food/milk.png") 
var potato_sprite = preload("res://resorces/food/potato.png") 
var tomato_sprite = preload("res://resorces/food/tomato.png") 
var banana_sprite = preload("res://resorces/food/banana.png") 


func _ready():
	food_type = randi() % 6
	match food_type:
		0:
			for i in get_node("food").get_child_count():
				get_node("food").get_child(i).texture = bread_sprite
		1:
			for i in get_node("food").get_child_count():
				get_node("food").get_child(i).texture = carrot_sprite
		2:
			for i in get_node("food").get_child_count():
				get_node("food").get_child(i).texture = milk_sprite
		3:
			for i in get_node("food").get_child_count():
				get_node("food").get_child(i).texture = potato_sprite
		4:
			for i in get_node("food").get_child_count():
				get_node("food").get_child(i).texture = tomato_sprite
		5:
			for i in get_node("food").get_child_count():
				get_node("food").get_child(i).texture = banana_sprite

func _on_food_body_entered(body):
	if body.name == "player" and body.num_food_in_cart < 5:
		$food_collect.play()
		body.num_food_in_cart = body.num_food_in_cart +1
		global.foods_in_cart[food_type] = global.foods_in_cart[food_type] +1
		body.food_spawn(food_type)
		print(global.foods_in_cart)
		queue_free()
