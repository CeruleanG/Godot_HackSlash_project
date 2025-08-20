extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Ui.fade_transition.fade_to_bright()
	Ui.heart.visible = false
	AudioController.play_sound("Upgrade")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
