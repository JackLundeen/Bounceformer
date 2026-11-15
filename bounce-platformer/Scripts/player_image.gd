extends Sprite2D


func _input(event):
	if event.is_action_pressed("look_left"):
		texture = load('res://Images/Knight player images/knight_left.png')
	elif event.is_action_pressed("look_right"):
		texture = load('res://Images/Knight player images/knight_right.png')
	elif event.is_action_pressed('look_up'):
		if texture == load('res://Images/Knight player images/knight_left.png'):
			texture = load("res://Images/Knight player images/knight_up_left.png")
		elif texture == load('res://Images/Knight player images/knight_right.png'):
			texture = load('res://Images/Knight player images/knight_up_right.png')
		elif texture == load("res://Images/Knight player images/knight_up_left.png") or texture == load("res://Images/Knight player images/knight_up_right.png"):
			pass
		else:
			texture = load("res://Images/Knight player images/knight_up_right.png")
