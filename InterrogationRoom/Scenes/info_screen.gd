extends Control


func _ready() -> void:
	self.hide()
	

func _on_tutorial_button_pressed() -> void:
	if self.visible:
		self.hide()
	else:
		self.show()
	

	
