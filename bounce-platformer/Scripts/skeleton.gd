extends CharacterBody2D

var startX = global_position.x
var startY = global_position.y
const SPEED = 5.0
var speed = 0
var type = 'normal'

@onready var player = $'../../Player'
@onready var lives = $'../../Lives'
@onready var RayR = $'RayCast2DR'
@onready var RayL = $'RayCast2DL'
@onready var map = $'../../TileMapLayer'
@onready var sprite = $'Sprite2D'

func _ready():
	if sprite.texture == load('res://Images/Enemies/Skeleton/skeleton_left1.png'):
		type = 'normal'
	elif sprite.texture == load('res://Images/Enemies/Skeleton/heart_skeleton_left.png'):
		type = 'heart'
	global_position.x = startX
	global_position.y = startY 

func _physics_process(delta):
	
	
	if player.global_position.x < global_position.x: 
		speed = -SPEED
		if type == 'normal':
			sprite.texture = load('res://Images/Enemies/Skeleton/skeleton_left1.png')
		elif type == 'heart':
			sprite.texture = load('res://Images/Enemies/Skeleton/heart_skeleton_left.png')

	else:
		speed = SPEED
		if type == 'normal':
			sprite.texture = load('res://Images/Enemies/Skeleton/skeleton_right1.png')
		elif type == 'heart':
			sprite.texture = load('res://Images/Enemies/Skeleton/heart_skeleton_right.png')
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	move_and_slide()
	
	if RayR.get_collider() == player or RayL.get_collider() == player:
		lives.lostLife()
		
	if speed < 0:
		if RayR.get_collider() != map:
			speed = 0
	else:
		if RayL.get_collider() != map:
			speed = 0

	global_position.x += speed
		
