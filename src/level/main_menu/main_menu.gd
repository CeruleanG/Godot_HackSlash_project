extends Control

@onready var option_menu: CanvasLayer = $OptionMenu

func _ready() -> void:
	AudioController.play_sound("Main")
	option_menu.exit_pressed.connect(on_option_menu_exit)

func toggle_base_menu_visibility(val: bool):
	$BaseMenu/BaseUI/TitleAndButton.visible = val

func toggle_option_menu_visibility(val: bool):
	$OptionMenu.visible = val

func on_option_menu_exit():
	toggle_base_menu_visibility(true)

func _on_option_pressed() -> void:
	toggle_base_menu_visibility(false)
	Input.action_press("escape")
	Input.action_release("escape")
