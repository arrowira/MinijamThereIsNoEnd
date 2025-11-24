extends RigidBody2D


@export var SPEED = 300.0
const JUMP_VELOCITY = -400.0
var tutorial = false
var dead=false
var stars = 0



func _ready() -> void:
	if get_parent().get_parent().name == "tutorial":
		tutorial = true
	else:
		$Camera2D.lvlStart()
func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("R"):
		death()
	var local_dir := Vector2.UP
	var local_left := Vector2.LEFT
	var world_dir := local_dir.rotated(rotation)
	var world_left := local_left.rotated(rotation)
	if !dead:
		if Input.is_action_pressed("turn left"):
			apply_torque(-2000)
			$rightThrustParts.emitting=true
			apply_force(world_left*SPEED*0.05)
		else:
			$rightThrustParts.emitting=false
		if Input.is_action_pressed("turn right"):
			apply_torque(2000)
			$leftThrustParts.emitting=true
			apply_force(world_left*SPEED*-0.05)
		else:
			$leftThrustParts.emitting=false
		if Input.is_action_pressed("accelerate"):
			apply_force(world_dir*SPEED)
			$thrustParticles.emitting=true
			$thrustSFX.volume_db=-10
		else:
			$thrustParticles.emitting=false
			$thrustSFX.volume_db=-80
		
func death():
	if !dead:
		dead = true
		$thrustSFX.volume_db=-80
		$fireParts.emitting=true
		$debrisParts.emitting=true
		$Sprite2D.visible=false
		$thrustParticles.visible=false
		linear_velocity = Vector2.ZERO
		gravity_scale=0
		$deathTimer.start()
		$deathSFX.play()

func _on_death_timer_timeout() -> void:
	if tutorial:
		get_tree().change_scene_to_file("res://scenes/tutorial.tscn")
	else:
		var level = randi_range(0,2)
		if level == 0:
			get_tree().change_scene_to_file("res://scenes/game_over.tscn")
		if level == 1:
			get_tree().change_scene_to_file("res://scenes/try_again.tscn")
		if level == 2:
			get_tree().change_scene_to_file("res://scenes/you_lose.tscn")
		




func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "border":
		death()
	elif area.name == "tutEnd":
		tutorial=false

func _on_area_2d_body_entered(body: Node2D) -> void:
	print(linear_velocity.length())
	if linear_velocity.length()>300:
		death()
