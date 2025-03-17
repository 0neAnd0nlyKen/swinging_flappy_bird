extends Node2D
class_name score_overlay

@export var scoreDisplay: Label
@export var highscoreDisplay: Label
@export var coinDisplay: Label

@export var score: int = 0
@export var highscore: int
@export var coin: int = 0

func _ready() -> void:
	loadScore()
	loadHighscore()
	loadCoin()
	
	updateScoreDisplay()
	updateHighscoreDisplay()
	updateCoinDisplay()

func loadScore():
	scoreDisplay.text = "0"
func loadHighscore():
	highscoreDisplay.text = "%d" % highscore
func loadCoin():
	coinDisplay.text = "0"

func updateScoreDisplay():
	scoreDisplay.text = "%d" % score
func updateHighscoreDisplay():
	highscoreDisplay.text = "%d" % highscore
func updateCoinDisplay():
	coinDisplay.text = "%d" % coin
	
