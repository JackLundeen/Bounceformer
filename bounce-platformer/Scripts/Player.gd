extends CharacterBody2D

var startX = global_position.x
var startY = global_position.y
const SPEED = 200.0
const JUMP_VELOCITY = -350

@onready var bullet = preload('res://Scenes/bullet.tscn')
@onready var lives = $'../Lives'
@onready var bullets = $'../Bullets' 
@onready var gun = $'../Player/Gun'

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		var Bullet = bullet.instantiate()
		bullets.add_child(Bullet)
		Bullet.directionx = cos(gun.rotation)
		Bullet.directiony = sin(gun.rotation)
		var offset = Vector2(25, 0).rotated(gun.global_rotation)
		Bullet.global_position = gun.global_position + offset
		Bullet.velocity = Vector2(Bullet.directionx, Bullet.directiony).normalized() * Bullet.speed

	if global_position.x > 1024:
		if Main.Level != 9:
			Main.Level += 1
			get_tree().change_scene_to_file('res://Scenes/Level' + str(Main.Level) + '.tscn')
		else:
			get_tree().change_scene_to_file('res://Scenes/YouWin.tscn')
		
	if global_position.y > 1024:
		lives.lostLife()
	
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

func respawn():
	global_position.x = startX
	global_position.y = startY
