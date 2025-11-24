extends TextureButton


func _on_advance_pressed() -> void:
	$ScrollContainer/Control/advance/ping.play()
