extends Node2D
var dragging = false
var of = Vector2(0,0)

func _ready() -> void:
	$text.hide()
	$Greg.hide()
	$InfoScreen.show()

func _on_hide_pressed() -> void:
	$deleteSound.play()
	self.hide()
	
func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout

func _process(delta: float) -> void:
	
	
	if !$Greg/emotion.selected == -1 \
	and !$Greg/connection.selected == -1 \
	and !$Greg/crim.selected == -1 \
	and !$Greg/violent.selected == -1 \
	and !$Greg/place.text == "" \
	and !$Greg/trust.selected == -1:
		$Greg/SAVE.disabled = false
	else:
		$Greg/SAVE.disabled = true
	
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


func _on_save_pressed() -> void:
	Global.greg_saved = true
	
	$text.show()
	await wait(2.0)
	$text.hide()
	
