extends CanvasLayer


signal exit_pressed

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("escape"):
		handle_toggle()

func handle_toggle():
	visible = !visible
	if visible:
		get_tree().paused = true
	else:
		get_tree().paused = false

func _on_back_button_pressed() -> void:
	exit_pressed.emit()
	handle_toggle()
	
