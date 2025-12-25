extends Node2D

var dragging = false
var of = Vector2(0,0)

func _on_hide_pressed() -> void:
	$deleteSound.play()
	self.hide()

func _process(delta: float) -> void:
	if dragging:
		position = get_global_mouse_position() - of
	
	
func Up() -> void:
	dragging = false


func Down() -> void:
	dragging = true
	of = get_global_mouse_position() - global_position


func OnTextSubmit() -> void:
	if $search/input.text == "Panya Gibson":
		$Output.show()
		$NothingFound.hide()
		$Output/PanyaCard.show()
		
		$Output/GreenCard.hide()
		$Output/GregCard.hide()
		$Output/TobyCard.hide()
		
	elif $search/input.text == "Toby Neely":
		$Output.show()
		$NothingFound.hide()
		$Output/TobyCard.show()
		
		$Output/GregCard.hide()
		$Output/PanyaCard.hide()
		$Output/GreenCard.hide()
		
	elif $search/input.text == "Gregory Wayne":
		$Output.show()
		$NothingFound.hide()
		$Output/GregCard.show()
		
		$Output/TobyCard.hide()
		$Output/PanyaCard.hide()
		$Output/GreenCard.hide()
	
	elif $search/input.text == "Herald Roman":
		$Output.show()
		$NothingFound.hide()
		$Output/GreenCard.show()
		
		$Output/TobyCard.hide()
		$Output/PanyaCard.hide()
		$Output/GregCard.hide()
		
	elif $search/input.text == "":
		$Output.hide()
		$NothingFound.hide()
		
	else:
		$Output.hide()
		$NothingFound.show()
