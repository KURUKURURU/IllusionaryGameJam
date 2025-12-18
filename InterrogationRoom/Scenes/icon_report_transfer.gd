extends TextureButton
signal ReportApp

func _gui_input(event):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and self.is_hovered() \
	and event.is_double_click():
		
		print("lol")
		emit_signal("ReportApp")
