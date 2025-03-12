extends Node2D
class_name wall
#func _ready() -> void:
	#var newWall = self.duplicate()
	#newWall.position.x+=100
	#get_parent().add_child(newWall)

#func _physics_process(delta):
	#position.x -=100 * delta
# Called when the node enters the scene tree for the first time.
func _on_visible_on_screen_enabler_2d_screen_entered() -> void:
	var newWall = self.duplicate()
	newWall.position.x+=450
	newWall.position.y+=randi_range(-100,100)
	get_parent().add_child(newWall)
	#print("IM HEREEEE")
	pass # Replace with function body.


func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	#print("BUH BYE")
	queue_free() # Replace with function body.
