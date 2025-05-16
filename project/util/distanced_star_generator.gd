@tool
extends "res://addons/starlight/StarGenerator.gd"

## Minimum distance from origin at which stars can generate
@export var min_distance: float:
	set(v):
		min_distance = v
		_regenerate = true

func sample_sphere(rng: RandomNumberGenerator, radius: float):
	# Absolutely suboptimal, but works for now
	while true:
		var pos = Vector3(
			rng.randf_range(-1.0, 1.0),
			rng.randf_range(-1.0, 1.0),
			rng.randf_range(-1.0, 1.0)
		)
		var length_squared = pos.length_squared()
		if length_squared <= 1.0:
			var real_length = sqrt(length_squared) * radius
			if real_length > min_distance:
				return pos * radius
