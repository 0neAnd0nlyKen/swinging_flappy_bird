extends Node2D

@onready var player: player = $"../PlayerNode/Player"

func _process(delta):
	## Update the camera's horizontal position to follow the player
	self.position.x = player.position.x
	#$menu.position.x = player.position.x
	
	#self.position.y = player.position.y
#
	## Lock the vertical position (keep it constant)
	#position.y = fixed_y_position  # Or any fixed value you want
##var fixed_y_position: float
##
##func _ready():
	##fixed_y_position = position.y
##
##func _process(delta):
	##position.y = fixed_y_position
