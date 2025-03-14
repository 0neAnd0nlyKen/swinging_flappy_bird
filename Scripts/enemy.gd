extends CharacterBody2D
class_name enemy_body
#@onready var player: player = $"../PlayerNode/Player"
#@onready var direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
#@export var speed = 60
##var gradient = randi_range(-180,180)
#var gradient = 0
#var direction_x = sin(gradient)
#var direction_y = cos(gradient)
#
#func _ready():
	#print(gradient)
#
#func _process(delta):
	#position.x = player.position.x
	#position += direction * speed * delta
#
	#print("direction is", direction.x, direction.y)
	##position += direction * speed * delta
	##position += Vector2(direction_x * speed * delta, direction_y * speed * delta)
#
##func _physics_process(delta):
	##position += Vector2(-2,0)
#
#func _on_body_entered(body):
	#if body is player:
		#get_tree().reload_current_scene()
		#pass
#
#
#func _on_visible_on_screen_notifier_2d_screen_exited():
	#gradient = randi_range(-90,90)
	#direction_x = sin(gradient)
	#direction_y = cos(gradient)
	#var position_when_exited = global_position
	#var viewport_rect = get_viewport_rect()
	#if position_when_exited.x < viewport_rect.position.x:
		#print("Exited from left edge")
	#elif position_when_exited.x > viewport_rect.end.x:
		#print("Exited from right edge")
	#elif position_when_exited.y < viewport_rect.position.y:
		#print("Exited from top edge")
	#elif position_when_exited.y > viewport_rect.end.y:
		#print("Exited from bottom edge")	
