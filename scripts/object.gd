extends StaticBody2D

@export var object_stats: UsableObject
@onready var interactable: Area2D = $interactable

func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact():
	OS.alert("Произошло взаимодействие", "Внимание!")
