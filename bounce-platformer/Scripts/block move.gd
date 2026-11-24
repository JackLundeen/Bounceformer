extends StaticBody2D

@onready var player = $'../Player'

func _physics_process(delta: float) -> void:
	global_position = player.global_position
