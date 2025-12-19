extends TextureButton
signal coolpressed
signal greg_page
signal toby_page

signal bookmark1
signal homebutt

func _on_advance_pressed() -> void:
	$ScrollContainer/Control/bookmark1/ping.play()
	emit_signal("coolpressed")
	#$Object2.hide()


func _on_bookmark_1_pressed() -> void:
	$ScrollContainer/Control/bookmark1/ping.play()
	emit_signal("bookmark1")


func _on_homebutt_pressed() -> void:
	$ScrollContainer/Control/bookmark1/ping.play()
	emit_signal("homebutt")


func _on_greg_pressed() -> void:
	$ScrollContainer/Control/bookmark1/ping.play()
	emit_signal("greg_page")


func _on_toby_pressed() -> void:
	$ScrollContainer/Control/bookmark1/ping.play()
	emit_signal("toby_page")
