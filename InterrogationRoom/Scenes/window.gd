extends TextureButton
signal coolpressed

func _on_advance_pressed() -> void:
	$ScrollContainer/Control/advance/ping.play()
	emit_signal("coolpressed")
	#$Object2.hide()
