extends Node3D
class_name TargetedRotatableCamera3D

const TARGET_TRANSITION_TIME = 0.5
const DISTANCE_TRANSITION_TIME = 0.5

@export var target: Node3D:
	set(v):
		target = v
		
		if _target_transition_tween != null:
			_target_transition_tween.stop()
		
		_target_transition_tween = get_tree().create_tween().parallel()
		_target_transition_tween.parallel().tween_property(self, "position", target.global_position, TARGET_TRANSITION_TIME).set_trans(Tween.TRANS_CUBIC)
		_target_transition_tween.parallel().tween_property(self, "rotation", target.global_rotation, TARGET_TRANSITION_TIME).set_trans(Tween.TRANS_CUBIC)
		await _target_transition_tween.finished
		
		_target_transition_tween = null

@export var distance: float = 30.0:
	set(v):
		distance = max(v, 0)
		camera.position.z = distance

@onready var camera: Camera3D = %Camera3D
@onready var camera_origin: Node3D = %CameraOrigin

var _target_transition_tween: Tween = null
var _distance_transition_tween: Tween = null

func _process(delta: float) -> void:
	if target != null:
		if _target_transition_tween == null:
			global_position = target.global_position
			global_rotation = target.global_rotation

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if event.button_mask:
			camera_origin.rotation_degrees.y -= event.screen_relative.x
			camera_origin.rotation_degrees.x = clamp(camera_origin.rotation_degrees.x - event.screen_relative.y, -90, 90)
			
	elif event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				zoom_in()
			elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				zoom_out()

func set_distance_animated(new_distance: float) -> void:
	if _distance_transition_tween != null:
		_distance_transition_tween.stop()
	
	_distance_transition_tween = get_tree().create_tween()
	_distance_transition_tween.tween_property(self, "distance", new_distance, DISTANCE_TRANSITION_TIME).set_trans(Tween.TRANS_CUBIC)
	await _distance_transition_tween.finished
	
	_distance_transition_tween = null

func zoom_in() -> void:
	distance *= 0.9

func zoom_out() -> void:
	distance *= 1.1
