extends Area2D

onready var global = get_node("/root/global")
onready var time = get_node("/root/timer")
var food_added

func _on_cashier_body_entered(body):
	if body.name == "player":
		food_added = 0
		for i in body.get_node("food_in_cart").get_child_count():
			body.get_node("food_in_cart").get_child(i).queue_free()
		for i in global.foods_in_cart.size():
			global.foods_collected[i] = global.foods_collected[i] + global.foods_in_cart[i]
			food_added = food_added + global.foods_in_cart[i]
		time.start(time.time_left +(food_added*10+((food_added/2)*5)))

