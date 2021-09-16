extends VehicleBody

onready var FL_Wheel = $FrontLeftWheel
onready var FR_Wheel = $FrontRightWheel
onready var RL_Wheel = $RearLeftWheel
onready var RR_Wheel = $RearRightWheel

func _input(event):
	if Input.is_action_pressed("FORWARD"):
		RL_Wheel.rotate_x(2)
		RR_Wheel.rotate_x(2)
		
	if Input.is_action_pressed("RIGHT"):
		FL_Wheel.rotate_y(-0.1)
		FR_Wheel.rotate_y(-0.1)
		clamp(FL_Wheel.rotation.y, -30, 30)
	
	if Input.is_action_pressed("LEFT"):
		FL_Wheel.rotate_y(0.1)
		FR_Wheel.rotate_y(0.1)
		clamp(FL_Wheel.rotation.y, -30, 30)
