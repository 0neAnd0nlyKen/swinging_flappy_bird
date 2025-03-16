extends Node2D
class_name webshooter

var direction := Vector2.ZERO
var tip = Vector2.ZERO
@export var link: Sprite2D
var shooting: bool = false
var swinging: bool = false

func shoot(dir: Vector2, mouse: Vector2):
	#print("shooting to",dir)
	direction = dir
	#tip = self.global_position
	tip = mouse
	shooting = true
func release():
	#$Tip.global_position=player_pos
	shooting = false
	swinging = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var tip_loc = to_local(tip)
	link.rotation = self.position.angle_to_point(tip_loc) - deg_to_rad(180)
	$Tip/Sprite2D.rotation = self.position.angle_to_point(tip_loc) - deg_to_rad(180)
	link.position = tip_loc/2
	link.region_rect.size.x = tip_loc.length() * 2

func _physics_process(delta):
	$Tip.global_position = tip
	if shooting:
		visible = true
		var collision=$Tip.move_and_collide(direction*100)
		if collision:
			tip=collision.get_collider().global_position
			#shooting = false
			swinging = true
	else:
		visible = false
	
	tip = $Tip.global_position
	
func get_tip_position() -> Vector2:
	return $Tip.global_position
