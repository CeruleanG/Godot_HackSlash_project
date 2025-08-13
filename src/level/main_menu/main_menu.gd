extends Control

func _ready() -> void:
	AudioController.play_sound("Main")

func toggle_base_menu_visibility(val: bool):
	$BaseMenu/BaseUI/TitleAndButton.visible = val

func toggle_option_menu_visibility(val: bool):
	$OptionMenu.visible = val


func _on_option_pressed() -> void:
	Input.action_press("escape")
	Input.action_release("escape")
