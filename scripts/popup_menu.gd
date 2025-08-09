extends PopupMenu

enum PopupIds {
	DESCRIPTION = 100,
}


func _on_popup_hide() -> void:
	clear()


func _on_id_pressed(id: int) -> void:
	match id:
		PopupIds.DESCRIPTION:
			print("lol")
