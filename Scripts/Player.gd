extends CharacterBody2D

class_name player
const UP = Vector2(0,-1)
const FLAP = 200
const MAXFALLSPEED = 200
const MOTION = Vector2()
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const WEB_PULL = 100

const camera_ceiling=-160
const camera_floor=160	
const wall_spawnpoint=400

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var Wall = preload("res://Scenes/wall_node.tscn")
@export var Webs: webshooter 
var score = 0
var coins = 0



func _physics_process(delta):
	# Add the gravity.

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept"):
		#velocity.y = JUMP_VELOCITY
	
	if $Webshooter.swinging:
		var swinging_velocity = to_local(Webs.get_tip_position()).normalized()
		#var swinging_velocity = Vector2(1,1)		
		#print("swinging_velocity is",swinging_velocity)
		velocity.y += swinging_velocity.y*2 
		velocity.x += swinging_velocity.x *2
	#elif not is_on_floor():
		##velocity.y += gravity * delta 
		#velocity.y += 100 * delta 
		#if velocity.y > MAXFALLSPEED:
			#velocity.y = MAXFALLSPEED

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	

#func Wall_reset():
	#var wall_instance=Wall.instantiate()
	#wall_instance.position=Vector2(wall_spawnpoint,randi_range(camera_ceiling+80,camera_floor-80))
	#get_parent().call_deferred("add_child",wall_instance)
#func _on_resetter_body_entered(body:walls):
	#body.queue_free()
	#Wall_reset()
	
func gameOver() -> void:
	get_tree().paused = true	
	
func _on_detect_body_entered(body):
	#if body.name == "Walls":
	if body is walls:
		gameOver()
		#get_tree().reload_current_scene()
	if body is enemy_body:
		print("coins = ", coins)
		if not coins:
			gameOver()
			#get_tree().reload_current_scene()
		coins -= 1
			
		



func _on_detect_area_entered(area):
	if area.name == "PointArea":
		score+=1
		print("SCORE = ", score)
	if area.name is coin:
		coins += 1
		
		


	
func _input(event) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			var mouse_global_pos = get_global_mouse_position()
			var direction_to_mouse = (mouse_global_pos - global_position).normalized()
			Webs.shoot(direction_to_mouse,mouse_global_pos)
		else:
			Webs.release()
