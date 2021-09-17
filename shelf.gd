extends StaticBody2D

var food = preload("res://food.tscn")

func spawn_food():
	if $foodspawn.get_child_count() == 0:
		if randi() % 7 > 5:
			var food_inst = food.instance()
			$foodspawn.add_child(food_inst)

func _ready():
	spawn_food()
