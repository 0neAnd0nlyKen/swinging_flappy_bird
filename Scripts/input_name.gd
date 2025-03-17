extends Node2D
class_name input_name

@onready var line_edit: LineEdit = $BoxContainer/LineEdit
@onready var label: Label = $BoxContainer/Label
var new_name: String

#func _ready() -> void:
	#line_edit.text_submitted.connect(_on_LineEdit_text_entered)
#
#func _on_LineEdit_text_entered(input_name: String):
	#new_name = input_name
