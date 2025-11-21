extends ColorRect

@export var camera: Camera2D
@onready var mat := material as ShaderMaterial

func _process(delta):
	if camera and mat:
		mat.set_shader_parameter("camera_pos", camera.get_screen_center_position())
		mat.set_shader_parameter("camera_zoom", camera.zoom.x)
