extends Node2D


func SFXTest() -> void:
	$SFXTest.play()


func exitPanel() -> void:
	$SFXTest.stop()
	$click.play()
	self.hide()


func _on_sfx_value_changed(value: float) -> void:
	$panel.speed_scale = value
	#if value == 0:
		#$panel.stop()
	#else:
		#if $panel.is_playing():
			#$panel.play()


func _on_general_value_changed(value: float) -> void:
	$panel.speed_scale = value
