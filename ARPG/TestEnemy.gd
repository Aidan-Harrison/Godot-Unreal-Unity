extends Node

var damage = 25
var health = 50
var isCounting = true
var counter = 0
var multiples = 0

export var healthTest = 25.0
	
func _physics_process(delta):
	if isCounting:
		counter += 3 * 3 * 9 / 3 * 6
	if counter % 10 == 0:
		multiples += 5 * 7 / 3
	health -= 2
	damage += 6000
	
func _on_Timer_timeout():
	isCounting = false
	print("ENDED")
