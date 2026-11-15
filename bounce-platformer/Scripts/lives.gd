extends Node2D

var Lives = 3
@onready var heart1 = $'../Lives/Life3'
@onready var heart2 = $'../Lives/Life2'
@onready var player = $'../Player'
@onready var bullets = $'../Bullets'
@onready var Skeletons = $'../Skeletons'


func lostLife():
	if Lives > 1:
		Lives -= 1
		if Lives == 2:
			heart1.texture = load('res://Images/GUI/Heart Containers/Empty Heart.png')
		elif Lives == 1:
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
	
