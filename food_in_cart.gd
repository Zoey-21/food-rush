extends RigidBody2D

var bread_sprite = preload("res://resorces/food/bread.png") 
var carrot_sprite = preload("res://resorces/food/carrot.png") 
var milk_sprite = preload("res://resorces/food/milk.png") 
var potato_sprite = preload("res://resorces/food/potato.png") 
var tomato_sprite = preload("res://resorces/food/tomato.png") 
var banana_sprite = preload("res://resorces/food/banana.png") 

export var food_type = 0


func _ready():
	match food_type:
		0:
			$Sprite.texture = bread_sprite
		1:
			$Sprite.texture = carrot_sprite
		2:
			$Sprite.texture = milk_sprite
		3:
			$Sprite.texture = potato_sprite
		4:
			$Sprite.texture = tomato_sprite
		5:
			$Sprite.texture = banana_sprite
