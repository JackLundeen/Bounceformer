extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -300.0

@onready var bullet = preload('res://Scenes/bullet.tscn')
@onready var bullets = $'../Bullets' 
@onready var player = $'../Player/Sprite2D'

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		if player.texture == load('res://Images/Knight player images/knight_idle.png'):
			pass
		elif player.texture == load('res://Images/Knight player images/knight_right.png'):
			var Bullet = bullet.instantiate()
			bullets.add_child(Bullet)
			Bullet.directionx = 1
			Bullet.directiony = randfn(-0.01, 0.01)
			Bullet.global_position.x = global_position.x + 20
			Bullet.global_position.y = global_position.y + 5
		elif player.texture == load('res://Images/Knight player images/knight_left.png'):
			var Bullet = bullet.instantiate()
			bullets.add_child(Bullet)
			Bullet.directionx = -1
			Bullet.directiony = randfn(-0.01, 0.01)
			Bullet.global_position.x = global_position.x - 20
			Bullet.global_position.y = global_position.y + 5
		elif player.texture == load('res://Images/Knight player images/knight_up_right.png'):
			var Bullet = bullet.instantiate()
			bullets.add_child(Bullet)
			Bullet.directionx = 1
			Bullet.directiony = -1
			Bullet.global_position.x = global_position.x + 10
			Bullet.global_position.y = global_position.y - 5
		elif player.texture == load('res://Images/Knight player images/knight_up_left.png'):
			var Bullet = bullet.instantiate()
			bullets.add_child(Bullet)
			Bullet.directionx = -1
			Bullet.directiony = -1
			Bullet.global_position.x = global_position.x - 10
			Bullet.global_position.y = global_position.y - 5
	
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
