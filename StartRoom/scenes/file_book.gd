extends Node2D
signal hidebutt
signal showbutt

func _ready() -> void:
	$bigimg.hide()
	$mainimg.texture = load("res://InterrogationRoom/images/report1.png")
	$putdown.hide()

func _process(delta: float) -> void:
	pass
		
	

func _on_hovernote_pressed() -> void:
	emit_signal("hidebutt")
	
	$bigimg.show()
	$mainimg/hovernote.hide()
	$putdown.show()


func _on_hovernote_mouse_entered() -> void:
	$mainimg.texture = load("res://InterrogationRoom/images/report2.png")


func _on_hovernote_mouse_exited() -> void:
	$mainimg.texture = load("res://InterrogationRoom/images/report1.png")


func _on_putdown_pressed() -> void:
	emit_signal("showbutt")
	$bigimg.hide()
	$putdown.hide()
	
	$mainimg/hovernote.show()
