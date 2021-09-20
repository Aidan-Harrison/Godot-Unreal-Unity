extends Node2D

export var timeOfDay = 0

func _on_TimeOfDay_timeout():
	timeOfDay += 1
	if(timeOfDay == 24):
		timeOfDay = 0
