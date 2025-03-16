extends Node2D
class_name enemy_class
@export var player: player
@export var max_speed = 200
#@onready var speed = randi_range(0, max_speed)
@onready var speed = max_speed
@onready var direction: Vector2 = Vector2(randf_range(-1,1) , randf_range(-1,1)).normalized()
@onready var enemy: CharacterBody2D = self.get_node("enemy")
@onready var moving: bool = false
#@onready var stay: bool = false
func _ready() -> void:
	flipIfChangeDir()
	#enemy.velocity = direction * speed

func flipIfChangeDir():
	$enemy/EnemySprite.flip_h = enemy.velocity.x < 0

func _process(delta: float) -> void:
	if not moving:
		return
	#if stay:
		#position.x = player,position.x
	#elif position.x == player.position.x:
		#stay = true
		
	
	#position.x = player.position.x
	var collision = enemy.move_and_collide(direction * speed * delta)
	if collision:
		direction = direction.bounce(collision.get_normal())
		enemy.velocity = direction * speed
		flipIfChangeDir()
		#if direction.x > 0:
			#enemy.velocity += player.velocity
				#enemy.velocity = enemy.velocity.rotated(PI/2.0)
		#enemy.velocity=Vector2(50,50)


func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	startMoving()

func startMoving() -> void:
	moving = true
	enemy.velocity = direction * speed
