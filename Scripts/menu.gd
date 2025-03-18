extends Node2D
class_name menu

@export var cur_x: int = self.position.x
@export var coins: int
@export var points: int
@export var high_scores: Array

@onready var input_name: LineEdit = $MarginContainer/game_over_menu/name_input
@onready var main_menu: VBoxContainer = $MarginContainer/main_menu
@onready var game_over_menu: VBoxContainer = $MarginContainer/game_over_menu
@onready var high_score_menu = $MarginContainer/high_score_menu
@onready var high_score_list = $MarginContainer/high_score_menu/high_score_list
@onready var text_file_menu: VBoxContainer = $MarginContainer/text_file_menu
@onready var text_file_content: Label = $MarginContainer/text_file_menu/text_file_content

#@onready var game_is_over = false
#func _ready() -> void:
	#hide()
#func _process(delta: float) -> void:
	#show()

func _on_play_pressed() -> void:
	get_tree().paused=false
	main_menu.hide()
	game_over_menu.show()
	hide()

	#get_tree().change_scene_to_file("res://Scenes/world.tscn")
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_restart_pressed() -> void:
	get_tree().paused=false
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_back_pressed():
	high_score_menu.visible = false
	main_menu.visible = true

#func load_high_scores():
	#high_score_list.clear()
	#var file = FileAccess.open("user://high_scores.save", FileAccess.READ)
	#if file:
		#var high_scores = file.get_var()
		#file.close()
		#for score in high_scores:
			#var label = Label.new()
			#label.text = str(score)
			#high_score_list.add_child(label)
	#else:
		#print("No high scores found.")


func _on_high_score_pressed() -> void:
	load_high_scores()
	main_menu.visible = false
	high_score_menu.visible = true
	print(high_scores)
	#load_high_scores()
	#pass # Replace with function body.

func load_high_scores() -> void:
	for score in high_scores:
		var label = Label.new()
		label.text = str(score)
		label.label_settings = preload("res://Sprites/blackFontLabel.tres")
		high_score_list.add_child(label)

func _on_back_from_text_file_pressed() -> void:
	text_file_menu.visible = false
	main_menu.visible = true

func _on_text_file_pressed() -> void:
	main_menu.visible = false
	text_file_menu.visible = true
	load_text_file_content()

func load_text_file_content() -> void:
	var file = FileAccess.open("res://assets credits.txt", FileAccess.READ)
	if file:
		var content = file.get_as_text()
		file.close()
		text_file_content.text = content
	else:
		text_file_content.text = "Failed to load text file."


func _on_credits_pressed() -> void:
	main_menu.visible = false
	text_file_menu.visible = true
	load_text_file_content()	
	pass # Replace with function body.


#func _on_margin_container_visibility_changed() -> void:
	#position.x = cur_x
	#pass # Replace with function body.
