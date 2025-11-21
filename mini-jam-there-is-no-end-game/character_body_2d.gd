extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_pressed("turn left"):
		rotate(-PI/180)
	if Input.is_action_pressed("turn right"):
		rotate(PI/180)
	

	
	move_and_slide()
