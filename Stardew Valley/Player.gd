extends KinematicBody2D

export var moveSpeed = 250

func _process(delta):
	if Input.is_action_pressed("Up"):
		position.y -= moveSpeed * delta
	if Input.is_action_pressed("Down"):
		position.y += moveSpeed * delta
	if Input.is_action_pressed("Left"):
		position.x -= moveSpeed * delta
	if Input.is_action_pressed("Right"):
		position.x += moveSpeed * delta
