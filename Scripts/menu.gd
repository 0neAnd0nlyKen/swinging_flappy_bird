extends Control
@export var coins: int
@export var points: int
func _ready() -> void:
	hide()
func _process(delta: float) -> void:
	show()
func _on_play_pressed() -> void:
	get_tree().paused=false
	get_tree().reload_current_scene()
	#get_tree().change_scene_to_file("res://Scenes/world.tscn")
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
