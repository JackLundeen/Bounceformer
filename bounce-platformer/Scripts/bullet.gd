extends CharacterBody2D

@onready var player = $'../../Player'
@onready var lives = $'../../Lives'
@onready var Skeletons = $'../../Skeletons'

var speed = 300
var directionx = 0
var directiony = 0

func _physics_process(delta):

	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		print(collision.get_collider())
		if collision.get_collider() == player:
			lives.lostLife()
		for Skeleton in Skeletons.get_children():
			if collision.get_collider() == Skeleton:
				if Skeleton.type == 'heart':
					lives.addLife()
				Skeleton.queue_free()

		
func clearBullets():
	queue_free()
