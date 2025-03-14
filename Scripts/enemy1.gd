extends CharacterBody2D
@export var player: player
@export var max_speed = 200
@onready var direction: Vector2 = Vector2(randi_range(-1,1) , randi_range(-1,1))
func _ready() -> void:
	velocity = direction

func _process(delta: float) -> void:
	var collision = move_and_collide(direction)
	if collision:
		velocity=velocity.bounce(collision)
