#extends Node2D
#
#var is_game_starting = true
#@onready var coinLabel: Label = $scoreOverlay/gridOverlay/coin_val
#var coins = 0
#func _ready():
	#get_tree().paused = true
	#coinLabel.text = "%d" % CoinManager.get_coin()
#
#func get_coin():
	#return coins
#
#func start_game():
	#is_game_starting = false
	#get_tree().paused = false
	#CoinManager.reset_coin()
	#coinLabel.text = "%d" % CoinManager.get_coin()
#
#func _process(delta):
	#if not is_game_starting and is_game_over():
		#show_game_over_scene()
	#else:
		#update_coin()
#
#func update_coin():
	## Example logic to increase coin
	#CoinManager.increase_coin(1)
	#coinLabel.text = "%d" % CoinManager.get_coin()
#
#func increase_coin(coin_val):
	#coins += coin_val
#
#func is_game_over():
	## Your game over logic here
	#return false
#
#func show_game_over_scene():
	## Logic to show the game over scene
	#pass
