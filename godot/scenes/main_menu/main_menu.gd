extends Control




func _on_BTN_NEW_GAME_pressed():
	get_tree().change_scene("res://scenes/selector_difficult/select_dificult.tscn")


func _on_BTN_CONTINUE_pressed():
	get_tree().change_scene("res://scenes/camps/camp0.tscn")


func _on_BTN_QUIT_pressed():
	get_tree().quit()
