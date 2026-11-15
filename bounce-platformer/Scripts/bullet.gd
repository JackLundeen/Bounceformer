extends Area2D


var speed = 300
var directionx = 1
var directiony = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += speed * directionx * delta
	position.y += speed * directiony * delta
