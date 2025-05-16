extends Node3D

@export var focus_point: Node3D:
	set(v):
		focus_point = v
		
		info_container.hide()
		body_select_panel.hide()
		
		if focus_point is FocusPoint:
			camera.set_distance_animated(focus_point.view_distance)
			
			if focus_point.info != null:
				info_container.show()
				_update_info_display(focus_point.info)
			else:
				body_select_panel.show()
			
		camera.target = focus_point

@onready var camera: TargetedRotatableCamera3D = %Camera
@onready var time_manager: TimeManager = %TimeManager

@onready var info_container := %BodyInfoContainer
@onready var info_name_label := %NameLabel
@onready var info_description_label := %RichDescriptionLabel
@onready var info_data_table := %DataContainer
@onready var body_select_panel := %BodySelectPanel
@onready var time_control := %TimeControl

@onready var default_focus: FocusPoint = %DefaultFocusPoint
@onready var neptune_focus: FocusPoint = %NeptuneFocusPoint
@onready var naiad_focus: FocusPoint = %NaiadFocusPoint
@onready var thalassa_focus: FocusPoint = %ThalassaFocusPoint
@onready var despina_focus: FocusPoint = %DespinaFocusPoint
@onready var galatea_focus: FocusPoint = %GalateaFocusPoint
@onready var larissa_focus: FocusPoint = %LarissaFocusPoint
# hippocamp
@onready var proteus_focus: FocusPoint = %ProteusFocusPoint
@onready var triton_focus: FocusPoint = %TritonFocusPoint
# nereid
# halimede
# sao
# s/2002
# laomedeia
# psamathe
# neso
# s/2021

func _ready() -> void:
	focus_point = default_focus
	time_manager.playing = time_control.playing
	time_manager.time_scale = 10 ** time_control.time_scale

func _unhandled_key_input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed():
		if event.keycode == KEY_1:
			focus_point = default_focus
		elif event.keycode == KEY_2:
			focus_point = neptune_focus
		elif event.keycode == KEY_3:
			focus_point = triton_focus

func _update_info_display(info) -> void:
	info_name_label.text = info.name
	info_description_label.bbcode_enabled = true
	info_description_label.text = info.description
	info_data_table.data = info.data

func _on_time_control_changed(playing: bool, time_scale: float) -> void:
	if time_manager != null:
		time_manager.playing = playing
		time_manager.time_scale = 10 ** time_scale

func _on_back_button_pressed() -> void:
	focus_point = default_focus

func _on_neptune_button_pressed() -> void:
	focus_point = neptune_focus

func _on_naiad_button_pressed() -> void:
	focus_point = naiad_focus

func _on_thalassa_button_pressed() -> void:
	focus_point = thalassa_focus

func _on_despina_button_pressed() -> void:
	focus_point = despina_focus

func _on_galatea_button_pressed() -> void:
	focus_point = galatea_focus

func _on_larissa_button_pressed() -> void:
	focus_point = larissa_focus

func _on_proteus_button_pressed() -> void:
	focus_point = proteus_focus

func _on_triton_button_pressed() -> void:
	focus_point = triton_focus

func _on_zoom_in_button_pressed() -> void:
	camera.zoom_in()

func _on_zoom_out_button_pressed() -> void:
	camera.zoom_out()
