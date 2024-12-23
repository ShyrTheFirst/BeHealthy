extends Control

func _on_start_pressed() -> void:
	if GameManager.FirstPlay:
		get_tree().change_scene_to_file("res://Scenes/GameMenus/game_config.tscn")
	
	else:
		get_tree().change_scene_to_file("res://Scenes/GameMenus/rest_screen.tscn")
