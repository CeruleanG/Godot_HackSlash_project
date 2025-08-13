extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Ui.heart.toggle_visible(true)
	Ui.fade_transition.fade_to_bright()
	AudioController.play_sound("Combat")
