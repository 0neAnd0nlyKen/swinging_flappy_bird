extends Node2D
class_name main_menu
@export var coins: int
@export var points: int
var gameIsOver: bool = false
#func _ready() -> void:
	#hide()
#func _process(delta: float) -> void:
	#show()
#func _on_play_pressed() -> void:
	#if gameIsOver:
		#get_tree().root.get_node("World").restart_game()
	#hide()
	#get_tree().root.get_node("World").start_game()
	##get_tree().change_scene_to_file("res://Scenes/world.tscn")
	#pass # Replace with function body.
#
#
#func _on_exit_pressed() -> void:
	#get_tree().quit()
	#pass # Replace with function body.
