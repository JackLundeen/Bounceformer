extends CollisionShape2D

func _physics_process(delta: float) -> void:
	if Main.blocking == true:
		disabled = false
	else:
		disabled = true
