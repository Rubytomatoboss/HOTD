extends Control
class_name BlackFrame


#var upper_text: String
#var center_text: String

@onready var upper_label: Label = $ColorRect/UpperLabel
@onready var center_label: Label = $ColorRect/CenterLabel


#func _process(delta: float) -> void:
	#upper_label.text = upper_text
	#center_label.text = center_text


func _on_object_show_black_frame(upper_text, center_text, visibility) -> void:
	if visibility == true:
		show()
		upper_label.text = upper_text
		center_label.text = center_text
	#print("lol")
	elif visibility == false:
		hide()
