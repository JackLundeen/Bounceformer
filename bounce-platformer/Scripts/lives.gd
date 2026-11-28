extends Node2D

@onready var heart1 = $'../Lives/Life3'
@onready var heart2 = $'../Lives/Life2'
@onready var heart3 = $'../Lives/Life1'
@onready var player = $'../Player'
@onready var bullets = $'../Bullets'
@onready var Skeletons = $'../Skeletons'

var canlooselife = true

func _ready():
	if Main.Live == 2:
		heart1.texture = load('res://Images/GUI/Heart Containers/Empty Heart.png')
	if Main.Live == 1:
		heart2.texture = load('res://Images/GUI/Heart Containers/Empty Heart.png')
		heart1.texture = load('res://Images/GUI/Heart Containers/Empty Heart.png')

func _physics_process(delta: float) -> void:
	print(canlooselife)

func lostLife():
	if canlooselife == true:
		if Main.Live > 1:
			canlooselife = false
			player.respawn()
			for bullet in bullets.get_children():
				bullet.queue_free()
			for Skeleton in Skeletons.get_children():
				Skeleton.global_position.x = Skeleton.startX
				Skeleton.global_position.y = Skeleton.startY
				Main.Live -= 1
				print(Main.Live)
			if Main.Live == 2:
				heart1.texture = load('res://Images/GUI/Heart Containers/Empty Heart.png')
				heart2.texture = load('res://Images/GUI/Heart Containers/Full Heart.png')
				heart3.texture = load('res://Images/GUI/Heart Containers/Full Heart.png')
			elif Main.Live == 3:
				heart2.texture = load('res://Images/GUI/Heart Containers/Full Heart.png')
				heart3.texture = load('res://Images/GUI/Heart Containers/Full Heart.png')
				heart1.texture = load('res://Images/GUI/Heart Containers/Full Heart.png')
			elif Main.Live == 1:
				heart1.texture = load('res://Images/GUI/Heart Containers/Empty Heart.png')
				heart2.texture = load('res://Images/GUI/Heart Containers/Empty Heart.png')
				heart3.texture = load('res://Images/GUI/Heart Containers/Full Heart.png')
			await get_tree().create_timer(0.1).timeout
			canlooselife = true
		else:
			get_tree().change_scene_to_file('res://Scenes/YouLost.tscn')

func addLife():
	if Main.Lives < 3:
		Main.Lives += 1
		
	if Main.Lives == 2:
		heart1.texture = load('res://Images/GUI/Heart Containers/Empty Heart.png')
		heart2.texture = load('res://Images/GUI/Heart Containers/Full Heart.png')
		heart3.texture = load('res://Images/GUI/Heart Containers/Full Heart.png')
	elif Main.Lives == 3:
		heart2.texture = load('res://Images/GUI/Heart Containers/Full Heart.png')
		heart3.texture = load('res://Images/GUI/Heart Containers/Full Heart.png')
		heart1.texture = load('res://Images/GUI/Heart Containers/Full Heart.png')
