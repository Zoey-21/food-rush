extends Node

# food goes 0:bread  1:carrot  2:banana  3:tomato  4:potato  5:milk
var foods_in_cart = [0,0,0,0,0,0]

var foods_collected = [0,0,0,0,0,0]

var foth = 10

var foods_collected_end = [0,0,0,0,0,0]

var time_played = 0.0

func _process(delta):
	time_played += delta
	
func get_time_played():
	return time_played
func reset_time_played():
	time_played = 0.0
