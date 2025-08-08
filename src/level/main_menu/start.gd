extends Button



func _on_pressed() -> void:
	Ui.fade_transition.fade_to_black()
	await Ui.fade_transition.faded_to_black_finished
	get_tree().change_scene_to_file("res://src/level/test_scene.tscn")
