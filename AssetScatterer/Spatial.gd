extends Spatial

#func _ready():
	#set_process(false)

#func _input(event):
	#if Input.is_action_just_pressed("Start"):
		#set_process(true)

func _process(delta):
	rotate_y(0.4 * delta)
