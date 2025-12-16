extends TextureButton

signal hidesignal

func _on_pressed() -> void:
	emit_signal("hidesignal")
