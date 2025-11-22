extends RigidBody2D


@export var SPEED = 300.0
const JUMP_VELOCITY = -400.0
var tutorial = true


func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("R"):
		if tutorial:
			get_tree().change_scene_to_file("res://scenes/tutorial.tscn")
	var local_dir := Vector2.UP
	var world_dir := local_dir.rotated(rotation)
	if Input.is_action_pressed("turn left"):
		apply_torque(-3000)
	if Input.is_action_pressed("turn right"):
		apply_torque(3000)
	if Input.is_action_pressed("accelerate"):
		apply_force(world_dir*SPEED)
		
	

	
