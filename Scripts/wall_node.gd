extends Node2D
class_name wall

@export var spawn_distance_max = 450
@export var spawn_distance_min = 100
@export var spawn_height_max = 60
var spawn_height_min = spawn_height_max * -1
@export var tighten_max = 125
var newWall: wall

func _ready() -> void:
	newWall = self.duplicate()
	tightenWalls()
	if(randi_range(0,2)):
		get_node("lowerEnemy").queue_free()
	if(randi_range(0,2)):
		get_node("upperEnemy").queue_free()
	pass

#func _physics_process(delta):
	#position.x -=100 * delta
# Called when the node enters the scene tree for the first time.
func tightenWalls() -> void:
	var randi=randi_range(0,tighten_max)
	$Walls/UpperPipeCol.position.y+=randi
	placeCoin(randi)

func placeCoin(tightened: int) -> void :
	var upper_limit = $Walls/UpperPipeCol.position.y + 80
	var lower_limit = $Walls/LowerPipeCol.position.y - 80
	var random = randi_range(upper_limit, lower_limit)
	$Walls/coin.position.y = random
	

func _on_visible_on_screen_enabler_2d_screen_entered() -> void:
	#var newWall: wall = self.duplicate()
	newWall.global_position.x += randi_range(spawn_distance_min, spawn_distance_max)
	newWall.global_position.y = randi_range(spawn_height_min, spawn_height_max)
	#newWall.position.y = 0
	#newWall.get_node("Walls/UpperPipeCol").position.y = 0 
	#newWall.get_node("Walls/UpperPipeCol").position.y = newWall.get_node("Walls/UpperPipeCol").position.y - 240 
	get_parent().add_child(newWall)
	
		#print("IM HEREEEE")
	pass # Replace with function body.


func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	#print("BUH BYE")
	$Walls.queue_free() # Replace with function body.
