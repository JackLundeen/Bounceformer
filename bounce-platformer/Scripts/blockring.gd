extends Sprite2D


func _physics_process(delta: float) -> void:
	if Main.blocking == true:
		visible = true
	else:
		visible = false
