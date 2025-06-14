extends Node2D
class_name world

var is_game_starting = true
@onready var menu_overlay: menu = $Visible/menu
@onready var scoreOverlay: score_overlay = $Visible/scoreOverlay

var score = 0
var coin = 0
var high_scores = []
const SAVE_FILE_PATH = "res://high_scores.save"
const MAX_HIGH_SCORES = 10

func _ready():
	load_high_scores()
	get_tree().paused = true
	scoreOverlay.coin = 0
	scoreOverlay.score = 0

func gameOver():
	$Visible/menu.cur_x = $PlayerNode/Player.position.x
	get_tree().paused = true
	$Visible/menu.show()


func _on_name_input_text_submitted(new_text: String) -> void:
	add_score(score, new_text)
	pass # Replace with function body.

func get_coin():
	return coin
func get_score():
	return score
func get_high_scores():
	return high_scores

func increase_coin(coin_val):
	coin += coin_val
	update_coin()
func increase_score(score_val):
	score += score_val	
	update_score()

func update_coin():
	scoreOverlay.coin = coin
	scoreOverlay.updateCoinDisplay()
func update_score():
	scoreOverlay.score = score
	scoreOverlay.updateScoreDisplay()

func load_high_scores():
	var file = FileAccess.open(SAVE_FILE_PATH, FileAccess.READ)
	if file:
		high_scores = file.get_var()
		file.close()
		$Visible/menu.high_scores = high_scores
		scoreOverlay.highscore = high_scores[0]["score"]
		scoreOverlay.updateHighscoreDisplay()
	else:
		high_scores = []

func save_high_scores():
	var file = FileAccess.open(SAVE_FILE_PATH, FileAccess.WRITE)
	file.store_var(high_scores)
	file.close()

func add_score(score, player_name):
	var new_score = {
		"score": score,
		"name": player_name,
		"datetime": Time.get_datetime_string_from_system()
	}
	high_scores.append(new_score)
	high_scores.sort_custom(func(a, b):
		return (b["score"] - a["score"]) < 0
	)
	if high_scores.size() > MAX_HIGH_SCORES:
		high_scores.resize(MAX_HIGH_SCORES)
	save_high_scores()



func _on_detect_area_entered(area: Area2D) -> void:
	if area.name == "PointArea":
		increase_score(1)
		print("SCORE = ", score)
	if area.name == "coin":
		increase_coin(1)
		

func _on_detect_body_entered(body: Node2D) -> void:
	#if body.name == "Walls":
		#get_tree().reload_current_scene()
	if body is enemy_body:
		#print("coins = ", coins)
		if not coin:
			gameOver()
			#get_tree().reload_current_scene()
		coin -= 1
			
	if body is walls:
		gameOver()


	pass # Replace with function body.
