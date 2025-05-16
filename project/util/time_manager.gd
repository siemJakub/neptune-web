extends Node
class_name TimeManager

@export var time_scale: float = 1.0
@export var playing: bool = true

var time: float = 0

func _process(delta: float) -> void:
	if playing:
		time += delta * time_scale
