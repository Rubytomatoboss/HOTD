extends CharacterBody2D
class_name Player #сделаем игрока классом, чтобы в будущем было проще

@export var speed: int
@export var popup: PopupMenu
@export var hit_box: Area2D

### движение
func _physics_process(delta: float) -> void: #встроенная функция, которая происходит 60 раз в в секунду
	velocity = speed * Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	move_and_slide()
	
func _process(delta: float) -> void:
	if hit_box.has_overlapping_bodies() == false:
		popup.hide()
	
func _input(event: InputEvent) -> void:
	if Input.is_key_pressed(KEY_E) and hit_box.has_overlapping_bodies():
		var object = hit_box.get_overlapping_bodies().front()
		popup.position = object.position
		popup.add_separator(object.object_stats.name)
		popup.add_item("Описание", 100)
		popup.show()
