extends Area2D


var speed = 300
var directionx = 1
var directiony = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += speed * directionx * delta
	position.y += speed * directiony * delta
	
	if global_position.x <= 0:
		directionx = -directionx
		directiony = -directiony
		global_position.x = 1
	elif global_position.x >= 1024:
		directionx = -directionx
		directiony = -directiony
		global_position.x = 1023
	if global_position.y <= 0:
		directionx = -directionx
		directiony = -directiony
		global_position.y = 1
	elif global_position.y >= 1024:
		directionx = -directionx
		directiony = -directiony
		global_position.y = 1023
		
