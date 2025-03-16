extends Node2D

var is_game_starting = true
@onready var scoreLabel: Label = $scoreOverlay/gridOverlay/score_val

func _ready():
	get_tree().paused = true
	scoreLabel.text = "%d" % ScoreManager.get_score()

func start_game():
	is_game_starting = false
	get_tree().paused = false
	ScoreManager.reset_score()
	scoreLabel.text = "%d" % ScoreManager.get_score()

func _process(delta):
	if not is_game_starting and is_game_over():
		show_game_over_scene()
	else:
		update_score()

func update_score():
	# Example logic to increase score
	ScoreManager.increase_score(1)
	scoreLabel.text = "%d" % ScoreManager.get_score()

func is_game_over():
	# Your game over logic here
	return false

func show_game_over_scene():
	# Logic to show the game over scene
	pass
