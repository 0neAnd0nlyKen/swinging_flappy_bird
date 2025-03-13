extends Area2D

class_name coin
# Called when the node enters the scene tree for the first time.
func _ready():
	#self.position.y+=randi_range(-50,50)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	pass


func _on_body_entered(body):
	if body is player:
		queue_free()
		print("coin got!")
		
#func _physics_process(delta):
	#position += Vector2(-2,0)
#
#
#func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	#var newWall = self.duplicate()
	#newWall.position.x+= 1000
	#newWall.position.y+=randi_range(-100,100)
	#get_parent().add_child(newWall)
	##print("IM HEREEEE")
	#pass # Replace with function body.
	
