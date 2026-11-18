extends CharacterBody2D

@onready var player = $'../../Player'
@onready var lives = $'../../Lives'
@onready var Skeletons = $'../../Skeletons'

var speed = 300
var directionx = 0
var directiony = 0
var damage = false

func _ready() -> void:
	add_collision_exception_with(player)
	await get_tree().create_timer(0.1).timeout
	damage = true
	remove_collision_exception_with(player)
	
func _physics_process(delta):

	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		print(collision.get_collider())
		if collision.get_collider() == player and damage == true:
			lives.lostLife()
		for Skeleton in Skeletons.get_children():
			if collision.get_collider() == Skeleton:
				if Skeleton.type == 'heart':
					lives.addLife()
				Skeleton.queue_free()

		
func clearBullets():
	queue_free()
