extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Main.SpeedRunTimer == false:
		texture_normal = load('res://Images/gui/speed run button/speedrun off.png')
	else:
		texture_normal = load('res://Images/GUI/Speed Run Button/SpeedRun On.png')



func _on_pressed() -> void:
	if Main.SpeedRunTimer == false:
		texture_normal = load('res://Images/gui/speed run button/speedrun On.png')
		Main.SpeedRunTimer = true
	else:
		texture_normal = load('res://Images/GUI/Speed Run Button/SpeedRun off.png')
		Main.SpeedRunTimer = false
