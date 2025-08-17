extends StaticBody2D
signal showBlackFrame

@export var object_stats: UsableObject
@onready var interactable: Area2D = $interactable


func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact(interaction):
	match interaction:
		"use":
			print("used")
		"examine":
			print("examined")
			emit_signal("showBlackFrame", object_stats.name, object_stats.description)
			Engine.time_scale = 0
			await press_to_continue()
			Engine.time_scale = 1

func press_to_continue():
	pass
