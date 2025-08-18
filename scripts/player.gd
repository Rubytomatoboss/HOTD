extends CharacterBody2D
class_name Player #сделаем игрока классом, чтобы в будущем было проще

@export var speed: int

### движение
func _physics_process(delta: float) -> void: #встроенная функция, которая происходит 60 раз в в секунду
	velocity = speed * Input.get_vector("move_left", "move_right", "move_up", "move_down")
	move_and_slide()
