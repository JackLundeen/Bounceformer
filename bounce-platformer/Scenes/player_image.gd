extends Sprite2D


func _input(event):
	if event.is_action_pressed("look_left"):
		texture = load('res://Images/Knight player images/knight_left.png')
	elif event.is_action_pressed("look_right"):
		texture = load('res://Images/Knight player images/knight_right.png')
