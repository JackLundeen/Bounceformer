extends AnimatedSprite2D


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("block"):
		if Main.block == true:
			Main.block = false
			play()
			Main.blocking = true
			await get_tree().create_timer(0.5).timeout
			Main.blocking = false
			
func _on_animation_finished() -> void:
	Main.block = true
