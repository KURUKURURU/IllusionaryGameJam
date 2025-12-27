extends TextureRect
signal SUBMIT


func _on_yes_pressed() -> void:
	emit_signal("SUBMIT")


func _on_no_pressed() -> void:
	self.hide()
