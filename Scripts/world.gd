extends Node2D
class_name world

var is_game_starting = true
var is_game_over = false
@onready var scoreOverlay: score_overlay = $Visible/scoreOverlay
@onready var mainMenu: main_menu = $Visible/Control

var score = 0
var coin = 0
var high_scores = []
const SAVE_FILE_PATH = "user://high_scores.save"
const MAX_HIGH_SCORES = 10

func _ready():
	get_tree().paused = true
	mainMenu.get_node("MarginContainer").show()
	load_high_scores()
	scoreOverlay.coin = 0
	scoreOverlay.score = 0
	
func start_game():
	mainMenu.get_node("MarginContainer").hide()
	is_game_starting = false	
	get_tree().paused = false

func restart_game():
	var current_scene = get_tree().current_scene
	if current_scene:
		var new_world = preload("res://Scenes/world.tscn").instantiate()
		get_tree().root.add_child(new_world)
		current_scene.remove_child(self)
		self.queue_free()

func _process(delta: float) -> void:
	var cur_x = $PlayerNode/Player.position.x
	$Visible.position.x = cur_x
	#$scoreOverlay/gridOverlay.position.x = cur_x


func gameOver():
	is_game_over = true
	get_tree().paused = true
	#$Visible/Control.gameIsOver = true
	mainMenu.get_node("MarginContainer").show()
	add_score(score)

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
	else:
		high_scores = []
	print(high_scores)
	scoreOverlay.highscore = high_scores[0]
	scoreOverlay.updateHighscoreDisplay()

func save_high_scores():
	var file = FileAccess.open(SAVE_FILE_PATH, FileAccess.WRITE)
	file.store_var(high_scores)
	file.close()

func add_score(score):
	#var new_name: String
	#var new_date = Time.get_datetime_string_from_system()
	#
	#var new_highscore: Dictionary = {
		#"highscore" : score,
		#"name" : new_name,
		#"date" : new_date,
	#}
	
	high_scores.append(score)
	high_scores.sort()
	high_scores.reverse()
	if high_scores.size() > MAX_HIGH_SCORES:
		high_scores.resize(MAX_HIGH_SCORES)
	save_high_scores()

#func inputNewName():
	#
	#line_edit.text_submitted.connect(_on_LineEdit_text_entered)
#
#func _on_LineEdit_text_entered(input_name: String):
	#new_name = input_name

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


func _on_play_pressed() -> void:
	if is_game_over == true:
		restart_game()
	start_game()
	print("playe pressed")
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
