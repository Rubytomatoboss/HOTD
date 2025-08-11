extends StaticBody2D

@export var object_stats: UsableObject
@onready var interactable: Area2D = $interactable
@export var black_frame: Control

func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact():
	if black_frame.visible:
		black_frame.hide()
	else:
		black_frame.show()
		black_frame.upper_text = object_stats.name
		black_frame.center_text = object_stats.description
