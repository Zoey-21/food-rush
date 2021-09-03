extends Label

onready var time = get_node("/root/timer")
var minutes 
var seconds


func _process(delta):
	minutes = String(int(timer.get_time_left())/60)
	seconds = int(timer.get_time_left())%60
	if seconds < 10: seconds = "0" + String(seconds) 
	else: seconds = String(seconds)
	text = minutes + ":" + seconds
