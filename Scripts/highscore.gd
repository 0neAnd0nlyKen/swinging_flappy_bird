extends Node


#func _ready():
	#load_high_scores()
#var high_scores = []
#
#const MAX_HIGH_SCORES = 10
#const SAVE_FILE_PATH = "user://high_scores.save"
#
#func load_high_scores():
	#var file = FileAccess.open(SAVE_FILE_PATH, FileAccess.READ)
	#if file:
		#high_scores = file.get_var()
		#file.close()
	#else:
		#high_scores = []
#
#func save_high_scores():
	#var file = FileAccess.open(SAVE_FILE_PATH, FileAccess.WRITE)
	#file.store_var(high_scores)
	#file.close()
#
#func add_score(score):
	#high_scores.append(score)
	#high_scores.sort()
	#high_scores.reverse()
	#if high_scores.size() > MAX_HIGH_SCORES:
		#high_scores.resize(MAX_HIGH_SCORES)
	#save_high_scores()
#
#func get_high_scores():
	#return high_scores
