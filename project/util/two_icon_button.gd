extends Button

@export var pressed_icon: Texture2D
@export var normal_icon: Texture2D

func _ready() -> void:
	_on_state_change()
	connect("button_down", _on_state_change)
	connect("button_up", _on_state_change)

func _on_state_change():
	if button_pressed:
		icon = pressed_icon
	else:
		icon = normal_icon
