extends Control


func play_button() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_world.tscn")


func exit_button() -> void:
	get_tree().quit()
