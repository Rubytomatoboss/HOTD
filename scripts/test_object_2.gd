extends StaticBody2D
signal showBlackFrame
signal movePlayerToLadder

@export var object_stats: UsableObject
@onready var interactable: Area2D = $interactable


func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact(interaction):
	match interaction:
		"use":
			print("used")
			get_tree().change_scene_to_file("res://world1.tscn")
			emit_signal("movePlayerToLadder")
		"examine":
			print("examined")
			emit_signal("showBlackFrame", object_stats.name, object_stats.description, true)
			Engine.time_scale = 0
			print_debug("Жириновский")
			
func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("press_to_continue") and Engine.time_scale == 0:
		Engine.time_scale = 1
		emit_signal("showBlackFrame", object_stats.name, object_stats.description, false)
