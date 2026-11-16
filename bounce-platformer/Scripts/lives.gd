extends Node2D

@onready var heart1 = $'../Lives/Life3'
@onready var heart2 = $'../Lives/Life2'
@onready var heart3 = $'../Lives/Life1'
@onready var player = $'../Player'
@onready var bullets = $'../Bullets'
@onready var Skeletons = $'../Skeletons'

func _ready():
	if Main.Lives == 2:
		heart1.texture = load('res://Images/GUI/Heart Containers/Empty Heart.png')
	if Main.Lives == 1:
		heart2.texture = load('res://Images/GUI/Heart Containers/Empty Heart.png')
		heart1.texture = load('res://Images/GUI/Heart Containers/Empty Heart.png')

func lostLife():
	if Main.Lives > 1:
		Main.Lives -= 1
		if Main.Lives == 2:
			heart1.texture = load('res://Images/GUI/Heart Containers/Empty Heart.png')
		elif Main.Lives == 1:
			heart2.texture = load('res://Images/GUI/Heart Containers/Empty Heart.png')
		player.respawn()
		for bullet in bullets.get_children():
			bullet.queue_free()
		for Skeleton in Skeletons.get_children():
			print('test')
			Skeleton.global_position.x = Skeleton.startX
			Skeleton.global_position.y = Skeleton.startY
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
