extends Node3D

@onready var cube: MeshInstance3D = $Cube
@onready var camera_orbit: Node3D = $CameraOrbit
@onready var camera_pitch: Node3D = $CameraOrbit/CameraPitch

@export_range(0.001, 0.02, 0.001) var mouse_sensitivity: float = 0.005
@export_range(10.0, 89.0, 1.0) var max_pitch_degrees: float = 80.0

var is_looking := false

func _process(delta: float) -> void:
	cube.rotate_y(delta * 0.8)
	cube.rotate_x(delta * 0.45)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT:
		is_looking = event.pressed
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED if is_looking else Input.MOUSE_MODE_VISIBLE
	elif event.is_action_pressed("ui_cancel") and is_looking:
		is_looking = false
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	elif event is InputEventMouseMotion and is_looking:
		camera_orbit.rotate_y(-event.relative.x * mouse_sensitivity)
		camera_pitch.rotation.x = clampf(
			camera_pitch.rotation.x - event.relative.y * mouse_sensitivity,
			-deg_to_rad(max_pitch_degrees),
			deg_to_rad(max_pitch_degrees)
		)
