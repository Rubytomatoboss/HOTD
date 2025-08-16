extends StaticBody2D

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
