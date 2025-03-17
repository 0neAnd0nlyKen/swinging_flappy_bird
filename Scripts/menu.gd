extends Control
@export var coins: int
@export var points: int

@onready var main_menu: VBoxContainer = $MarginContainer/main_menu
@onready var game_over_menu: VBoxContainer = $MarginContainer/game_over_menu
#@onready var game_is_over = false
func _ready() -> void:
	hide()
func _process(delta: float) -> void:
	show()
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
