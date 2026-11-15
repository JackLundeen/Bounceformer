extends CharacterBody2D

@onready var player = $'../../Player'
@onready var lives = $'../../Lives'
@onready var Skeletons = $'../../Skeletons'

var speed = 150
var directionx = 1
var directiony = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position.x += speed * directionx * delta
	position.y += speed * directiony * delta
	
	if global_position.x <= 0:
		directionx = -directionx
		global_position.x = 1
	elif global_position.x >= 1024:
		directionx = -directionx
		global_position.x = 1023
	if global_position.y <= 0:
		directiony = -directiony
		global_position.y = 1
	elif global_position.y >= 1024:
		directiony = -directiony
		global_position.y = 1023
		
	var collision = move_and_collide(Vector2(speed * directionx, speed * directiony) * delta)
	if collision:
		directionx = -directionx
		directiony = -directiony
		print(collision.get_collider())
		if collision.get_collider() == player:
			lives.lostLife()
		for Skeleton in Skeletons.get_children():
			if collision.get_collider() == Skeleton:
				Skeleton.queue_free()

		
func clearBullets():
	queue_free()
