extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	Ui.fade_transition.fade_to_black()
	await Ui.fade_transition.faded_to_black_finished
	AudioController.stop_sound("Upgrade")
	get_tree().change_scene_to_file("res://src/level/test_scene.tscn")
