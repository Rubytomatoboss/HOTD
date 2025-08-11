extends Area2D

@export var interact_name: String #имя взаимодействия "войти в подземелье" или "открыть сундук" и т.д.
@export var is_interactable: bool = true #можно ли взаимодействовать

var interact: Callable = func(): #пустая функция, в которую добавляются условия скриптом объекта
	pass
