extends Node2D

@export var interact_label: Label
var current_interactions := [] #список объектов для взаимодействия
var can_interact := true

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interaction") and can_interact:
		if current_interactions:
			can_interact = false
			interact_label.hide()
			
			await current_interactions[0].interact.call("use") #подождать пока функция полностью выполниться и после этого закончить код
			
			can_interact = true
	elif event.is_action_pressed("examine") and can_interact:
		if current_interactions:
			can_interact = false
			interact_label.hide()
			
			await current_interactions[0].interact.call("examine") #подождать пока функция полностью выполниться и после этого закончить код
			
			can_interact = true

func _process(delta: float) -> void:
	if current_interactions and can_interact: #если есть объекты для взаимодействия и игрок может взаимодействовать,то
		current_interactions.sort_custom(_sort_by_nearest) #сделать сортировку
		if current_interactions[0].is_interactable: #если с первым объектом можно взаимодействовать, то
			interact_label.text = current_interactions[0].interact_name #поменять текст надписи над объектом на текст, который написан в объекте
			interact_label.show()
	else:
		interact_label.hide()


func _sort_by_nearest(area1, area2): #кастомная сортировка объектов для взаимодействия. Объекты, которые ближе остальных становятся на первое место в списке
	var area1_dist = global_position.direction_to(area1.global_position)
	var area2_dist = global_position.direction_to(area2.global_position)
	return area1_dist < area2_dist

func _on_interaction_range_area_entered(area: Area2D) -> void:
	current_interactions.push_back(area) 
#если в области игрока появляется объект для взаимодействия, то он добавляется в список объектов для взаимодействия

func _on_interaction_range_area_exited(area: Area2D) -> void:
	current_interactions.erase(area)
#если в области игрока исчез объект для взаимодействия, то он удалится
