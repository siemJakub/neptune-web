@tool
extends Node3D
class_name CircularRotator

## The period of a complete rotation, in seconds
@export var period: float

@onready var time_manager: TimeManager = _get_time_manager()

func _get_time_manager() -> TimeManager:
	var current_scene = get_tree().current_scene
	if current_scene != null:
		for child in current_scene.get_children():
			if child is TimeManager:
				return child
	return null

func _update_position():
	rotation_degrees.y = -(fmod(time_manager.time, period) / period) * 360

func _process(delta: float) -> void:
	if not Engine.is_editor_hint():
		_update_position()
