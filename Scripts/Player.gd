extends CharacterBody3D

var mouse_relative_x = 0
var mouse_relative_y = 0

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	rotation.x = 0
	rotation.z = 0

func _input(event):
	if event is InputEventMouseMotion:
		rotation.y -= event.relative.x / 1000
		$CamHolder/Camera.rotation.x -= event.relative.y / 1000
		$CamHolder/Camera.rotation.x = clamp( $CamHolder/Camera.rotation.x, deg_to_rad(-90), deg_to_rad(90) )
		
#	Getting the mouse movement for the weapon sway in the physics process
	if event is InputEventMouseMotion:
		mouse_relative_x = clamp(event.relative.x, -50, 50)
		mouse_relative_y = clamp(event.relative.y, -50, 10)
		
	if event.is_action_pressed("Quit"):
		get_tree().quit()
