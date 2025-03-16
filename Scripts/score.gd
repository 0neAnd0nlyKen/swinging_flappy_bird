extends Node2D

#
#var score = 1
#var is_game_starting = true
#@export var scoreLabel: scoreOverlay
#
##func _ready():
	##scoreLabel.text = "%d" % ScoreManager.get_score()
	##get_tree().paused = true
	##scoreLabel.text = "%d" % ScoreManager.get_score()
#
#func start_game():
	#is_game_starting = false
	#get_tree().paused = false
	#ScoreManager.reset_score()
	#scoreLabel.scoreDisplay = ScoreManager.get_score()
#
#
#func _process(delta):
	#if not is_game_starting and is_game_over():
		#show_game_over_scene()
	#else:
		#update_score()
#
#func get_score():
	#return score
#
#func reset_score():
	#score = 0
#func update_score():
	## Example logic to increase score
	#ScoreManager.increase_score(1)
	#scoreLabel.scoreDisplay = ScoreManager.get_score()
	#scoreLabel.updateScoreDisplay()
#func increase_score(score_val):
	#score += score_val	
#
#func is_game_over():
	## Your game over logic here
	#return false
#
#func show_game_over_scene():
	## Logic to show the game over scene
	#pass
