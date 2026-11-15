extends CharacterBody2D


const SPEED = 5.0
var speed = 0
@onready var player = $'../Player'
@onready var lives = $'../Lives'
@onready var RayR = $'RayCast2DR'
@onready var RayL = $'RayCast2DL'
@onready var map = $'../TileMapLayer'
func _physics_process(delta):
	
	
	if player.global_position.x < global_position.x: 
		speed = -SPEED
	else:
		speed = SPEED
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	move_and_slide()
	
	if RayR.get_collider() == player or RayL.get_collider() == player:
		lives.lostLife()
		await get_tree().create_timer(1).timeout
	if speed < 0:
		if RayR.get_collider() != map:
			speed = 0
	else:
		if RayL.get_collider() != map:
			speed = 0

	global_position.x += speed
		
