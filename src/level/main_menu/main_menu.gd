extends Control


func toggle_base_menu_visibility(val: bool):
	$BaseMenu/BaseUI/TitleAndButton.visible = val

func toggle_option_menu_visibility(val: bool):
	$OptionMenu.visible = val


func _on_option_pressed() -> void:
	toggle_base_menu_visibility(false)
	toggle_option_menu_visibility(true)


func _on_back_button_pressed() -> void:
	toggle_base_menu_visibility(true)
	toggle_option_menu_visibility(false)
