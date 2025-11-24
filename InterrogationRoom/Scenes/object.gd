extends TextureButton

var dragging = false
var of = Vector2(0,0)


func _process(delta: float) -> void:
	if dragging:
		position = get_global_mouse_position() - of
	
	
func Up() -> void:
	dragging = false


func Down() -> void:
	dragging = true
	of = get_global_mouse_position() - global_position


func _on_hide_pressed() -> void:
	self.hide()


func _on_hide_fail_pressed() -> void:
	$fail_ping.play()
	$Shake.play("shake")
