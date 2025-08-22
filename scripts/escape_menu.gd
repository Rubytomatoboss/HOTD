extends Control

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("escape"):
		visible = true
		Engine.time_scale = 0

func _on_back_to_game_button_pressed() -> void:
	visible = false
	Engine.time_scale = 1


func _on_exit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
	Engine.time_scale = 1
