extends Node2D
var dragging = false
var of = Vector2(0,0)

func _ready() -> void:
	$Greg.hide()
	$InfoScreen.show()

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


func _on_iaccept_pressed() -> void:
	$InfoScreen/fancyfade.play("fade")
	await $InfoScreen/fancyfade.animation_finished
	$InfoScreen.hide()


func Character_Option_Selection(index: int) -> void:
	
	if index == 0:
		$Greg.show()
	elif index == 1:
		$Greg.hide()
		


func _on_tutorial_button_pressed() -> void:
	$TutorialButton/info/slide.play("open")
