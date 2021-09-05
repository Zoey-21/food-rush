extends Area2D

onready var global = get_node("/root/global")
onready var time = get_node("/root/timer")
var food_added = 0
var foth_added = 0

func _on_cashier_body_entered(body):
	if body.name == "player":
		$sale.play()
		body.num_food_in_cart = 0
		$AnimationPlayer.play("sale")
		for i in body.get_node("food_in_cart").get_child_count():
			body.get_node("food_in_cart").get_child(i).queue_free()
		for i in global.foods_in_cart.size():
			global.foods_collected[i] = global.foods_collected[i] + global.foods_in_cart[i]
			food_added = food_added + global.foods_in_cart[i]
			if i == global.foth:
				foth_added = foth_added + global.foods_in_cart[i]
			global.foods_in_cart[i] = 0
		print(global.foods_collected)
		time.start(time.time_left + ( food_added*3 ) + ( 3*foth_added ))
		food_added = 0
		foth_added = 0
		
