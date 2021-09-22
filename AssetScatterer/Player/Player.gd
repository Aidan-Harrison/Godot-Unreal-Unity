extends KinematicBody

var velocity = Vector3()
export var moveSpeed : float = 15
const gravity :float = 35.0
var mouse = Vector2.ZERO
var sensitivity = 0.4

func _ready():
	set_physics_process(true)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta):
	velocity.x = 0
	velocity.z = 0
	  
	var input = Vector3()
	  
	if Input.is_action_pressed("forward"): 
		input.z += 1
	if Input.is_action_pressed("backward"):
		input.z -= 1
	if Input.is_action_pressed("left"): 
		input.x += 1
	if Input.is_action_pressed("right"): 
		input.x -= 1

	input = input.normalized()
	  
	var dir = (transform.basis.z * input.z + transform.basis.x * input.x)
	  
	velocity.x = dir.x * moveSpeed
	velocity.z = dir.z * moveSpeed
	velocity.y -= gravity * delta
	
	velocity = move_and_slide(velocity, Vector3.UP)
	
	$Spatial.rotation_degrees.y -= mouse.x * sensitivity
	mouse = Vector2.ZERO # reset to avoid constant input
	
func _input(event):
	if event is InputEventMouseMotion: 
		mouse = event.relative
