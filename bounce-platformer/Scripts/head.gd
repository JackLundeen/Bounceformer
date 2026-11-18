extends Sprite2D
var Mouse_Pos = get_global_mouse_position()

func _physics_process(delta: float) -> void:
	Mouse_Pos = get_global_mouse_position()
	if Mouse_Pos.x > global_position.x:
		flip_v = false
	elif Mouse_Pos.x < global_position.x:
		flip_v = true
	look_at(Mouse_Pos)
