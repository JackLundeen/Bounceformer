extends TextureButton
@onready var sprite2D = $'../TextureButton/Sprite2D'



func _on_button_down() -> void:
	sprite2D.texture = load('res://Images/GUI/Play Button/play_button_pressed.png')


func _on_button_up() -> void:
	sprite2D.texture = load('res://Images/GUI/Play Button/play_button.png')
	get_tree().change_scene_to_file('res://Scenes/Level1.tscn')
	Main.reset()
