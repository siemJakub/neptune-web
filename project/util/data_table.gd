@tool
extends GridContainer
class_name DataTable

@export var data: Dictionary[String, String] = {
	"Key 1": "Value 1",
	"Key 2": "Value 2"
}:
	set(v):
		data = v
		_update_display()

func _ready() -> void:
	_update_display()

func _update_display() -> void:
	columns = 2
	
	for child in get_children():
			child.queue_free()
	
	for key in data:
		_add_label_pair(key, data[key])

func _add_label_pair(text1: String, text2: String) -> void:
	var label1 := Label.new()
	label1.text = text1
	label1.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	label1.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	label1.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	
	var label2 := Label.new()
	label2.text = text2
	label2.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	label2.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	label2.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	label2.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	
	add_child(label1)
	add_child(label2)
	move_child(label1, 0)
	move_child(label2, 1)
