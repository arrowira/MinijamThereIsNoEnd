extends Camera2D

var lvlAnchor = Vector2(0,0)
var farZoom = 0.2
var moving = false
var anchorPos = Vector2.ZERO
var zoomSpeed = 0.5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lvlStart()
var playerPos = Vector2.ZERO
var t = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if moving and t<1:
		zoom.x = lerp(farZoom, 1.7, t)
		zoom.y = lerp(farZoom, 1.7, t)
		position = lerp(anchorPos,Vector2.ZERO,t)
		t+=0.01*zoomSpeed
	elif t >1:
		get_parent().dead = false
	

func lvlStart():
	get_parent().dead = true
	global_position = lvlAnchor
	zoom.x = farZoom
	zoom.y = farZoom
	$zoomTimer.start()
	
func _on_zoom_timer_timeout() -> void:
	playerPos = get_parent().position
	moving=true
	anchorPos = position
	t=0
