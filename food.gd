extends Area2D

onready var global = get_node("/root/global")
export var food_type = 0

func _on_food_body_entered(body):
	if body.name == "player":
		global.foods_in_cart[food_type] = global.foods_in_cart[food_type] +1
		body.food_spawn(food_type)
		print(global.foods_in_cart)
		queue_free()
