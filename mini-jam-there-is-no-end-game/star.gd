extends Node2D

@export var fade_time := 0.1
var fading := false
var fade_timer := 0.0
@export var randomized = true


func _ready() -> void:
	$AnimationPlayer.play("starShake")
	if randomized:
		if randi_range(0,10)<5:
			queue_free()

func _process(delta):
	if fading:
		fade_timer += delta
		var t = fade_timer / fade_time
		$Star1_png.modulate.a = lerp(1.0, 0.0, t)
		if t >= 1.0:
			queue_free()

func _on_body_entered(body):
	if body.name == "playerCollider":
		fading = true
		set_process(true)
		$AudioStreamPlayer.play()
