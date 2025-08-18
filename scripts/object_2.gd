extends StaticBody2D
signal showBlackFrame

@export var object_stats: UsableObject
@onready var interactable: Area2D = $interactable
@export var player: CharacterBody2D
@export var up_ladder: StaticBody2D

func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact(interaction):
	match interaction:
		"use":
			if Engine.time_scale == 1:
				print("used")
				player.position = up_ladder.position+Vector2(16, 0)
				emit_signal("showBlackFrame", object_stats.name, object_stats.description, false)
		"examine":
			print("examined")
			emit_signal("showBlackFrame", object_stats.name, object_stats.description, true)
			Engine.time_scale = 0
			print_debug("Жириновский")
			
func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("press_to_continue") and Engine.time_scale == 0:
		Engine.time_scale = 1
		emit_signal("showBlackFrame", object_stats.name, object_stats.description, false)
