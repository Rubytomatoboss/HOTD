extends CharacterBody2D
class_name Player #сделаем игрока классом, чтобы в будущем было проще

@export var speed: int
@export var popup: PopupMenu
@export var ray_cast:RayCast2D

### движение
func _physics_process(delta: float) -> void: #встроенная функция, которая происходит 60 раз в в секунду
	velocity = speed * Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	move_and_slide()

	ray_cast.target_position = get_global_mouse_position() 
	
	if ray_cast.collide_with_bodies:
		print(ray_cast.get_collider(), get_global_mouse_position())
		
func _input(event: InputEvent) -> void:
	if Input.is_key_pressed(KEY_E):
		popup.position = get_viewport().get_mouse_position()
		popup.show()
