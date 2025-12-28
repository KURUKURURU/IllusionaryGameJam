extends Node2D

var scene: String

var dragging = false
var of = Vector2(0,0)

signal DONE

var add_end = 0

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
	
	Global.total = float(add_end)/36.0 * 100.0
	
	if scene == "Greg":
		$default/Character_Option.set_item_disabled(0, false)
		$default/Character_Option.set_item_disabled(1, true)
		$default/Character_Option.set_item_disabled(2, true)
		$default/Character_Option.set_item_disabled(3, true)
		$default/Character_Option.set_item_disabled(4, true)
		$default/Character_Option.set_item_disabled(5, true)
	elif scene == "Toby":
		$default/Character_Option.set_item_disabled(0, true)
		$default/Character_Option.set_item_disabled(1, false)
		$default/Character_Option.set_item_disabled(2, true)
		$default/Character_Option.set_item_disabled(3, true)
		$default/Character_Option.set_item_disabled(4, true)
		$default/Character_Option.set_item_disabled(5, true)
	elif scene == "Panya":
		$default/Character_Option.set_item_disabled(0, true)
		$default/Character_Option.set_item_disabled(1, true)
		$default/Character_Option.set_item_disabled(2, false)
		$default/Character_Option.set_item_disabled(3, true)
		$default/Character_Option.set_item_disabled(4, true)
		$default/Character_Option.set_item_disabled(5, true)
	elif scene == "Herald":
		$default/Character_Option.set_item_disabled(0, true)
		$default/Character_Option.set_item_disabled(1, true)
		$default/Character_Option.set_item_disabled(2, true)
		$default/Character_Option.set_item_disabled(3, false)
		$default/Character_Option.set_item_disabled(4, true)
		$default/Character_Option.set_item_disabled(5, true)
	elif scene == "Riley":
		$default/Character_Option.set_item_disabled(0, true)
		$default/Character_Option.set_item_disabled(1, true)
		$default/Character_Option.set_item_disabled(2, true)
		$default/Character_Option.set_item_disabled(3, true)
		$default/Character_Option.set_item_disabled(4, false)
		$default/Character_Option.set_item_disabled(5, true)
	elif scene == "Steph":
		$default/Character_Option.set_item_disabled(0, true)
		$default/Character_Option.set_item_disabled(1, true)
		$default/Character_Option.set_item_disabled(2, true)
		$default/Character_Option.set_item_disabled(3, true)
		$default/Character_Option.set_item_disabled(4, true)
		$default/Character_Option.set_item_disabled(5, false)
		
		
	if !$Toby/emotion.selected == -1 \
	and !$Toby/connection.selected == -1 \
	and !$Toby/crim.selected == -1 \
	and !$Toby/violent.selected == -1 \
	and !$Toby/place.text == "" \
	and !$Toby/trust.selected == -1:
		$Toby/SAVE.disabled = false
	else:
		$Toby/SAVE.disabled = true
	
	if !$Greg/emotion.selected == -1 \
	and !$Greg/connection.selected == -1 \
	and !$Greg/crim.selected == -1 \
	and !$Greg/violent.selected == -1 \
	and !$Greg/place.text == "" \
	and !$Greg/trust.selected == -1:
		$Greg/SAVE.disabled = false
	else:
		$Greg/SAVE.disabled = true
		
	if !$Panya/emotion.selected == -1 \
	and !$Panya/connection.selected == -1 \
	and !$Panya/crim.selected == -1 \
	and !$Panya/violent.selected == -1 \
	and !$Panya/place.text == "" \
	and !$Panya/trust.selected == -1:
		$Panya/SAVE.disabled = false
	else:
		$Panya/SAVE.disabled = true
	
	if !$Herald/emotion.selected == -1 \
	and !$Herald/connection.selected == -1 \
	and !$Herald/crim.selected == -1 \
	and !$Herald/violent.selected == -1 \
	and !$Herald/place.text == "" \
	and !$Herald/trust.selected == -1:
		$Herald/SAVE.disabled = false
	else:
		$Herald/SAVE.disabled = true
	
	if !$Riley/emotion.selected == -1 \
	and !$Riley/connection.selected == -1 \
	and !$Riley/crim.selected == -1 \
	and !$Riley/violent.selected == -1 \
	and !$Riley/place.text == "" \
	and !$Riley/trust.selected == -1:
		$Riley/SAVE.disabled = false
	else:
		$Riley/SAVE.disabled = true
		
	if !$Steph/emotion.selected == -1 \
	and !$Steph/connection.selected == -1 \
	and !$Steph/crim.selected == -1 \
	and !$Steph/violent.selected == -1 \
	and !$Steph/place.text == "" \
	and !$Steph/trust.selected == -1:
		$Steph/SAVE.disabled = false
	else:
		$Steph/SAVE.disabled = true
	
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
		$Panya.hide()
		$Toby.hide()
		$Herald.hide()
		$Riley.hide()
		$Steph.hide()
		$Greg.show()
	elif index == 1:
		$Panya.hide()
		$Greg.hide()
		$Herald.hide()
		$Riley.hide()
		$Steph.hide()
		$Toby.show()
	elif index == 2:
		$Panya.show()
		$Greg.hide()
		$Toby.hide()
		$Riley.hide()
		$Steph.hide()
		$Herald.hide()
	elif index == 3:
		$Panya.hide()
		$Greg.hide()
		$Riley.hide()
		$Steph.hide()
		$Toby.hide()
		$Herald.show()
		
	elif index == 4:
		$Panya.hide()
		$Greg.hide()
		$Riley.show()
		$Steph.hide()
		$Toby.hide()
		$Herald.hide()
		
	elif index == 5:
		$Panya.hide()
		$Greg.hide()
		$Riley.hide()
		$Steph.show()
		$Toby.hide()
		$Herald.hide()
		


func _on_tutorial_button_pressed() -> void:
	$TutorialButton/info/slide.play("open")


func _on_save_pressed() -> void:
	
	if scene == "Greg":
		Global.greg_saved = true
	if scene == "Toby":
		Global.toby_saved = true
	if scene == "Panya":
		Global.panya_saved = true
	if scene == "Herald":
		Global.green_saved = true
	if scene == "Riley":
		Global.riley_saved = true
	if scene == "Steph":
		Global.steph_saved = true
	
	$text.show()
	await wait(2.0)
	$text.hide()
	

func SUBMIT() -> void:
	
	add_end = 0
	
	#GREG
	
	if Global.G_emotion == 0:
		add_end = add_end + 1
	if Global.G_connection == 0:
		add_end = add_end + 1
	if Global.G_crim == 0:
		add_end = add_end + 1
	if Global.G_violent == 1:
		add_end = add_end + 1
	if Global.G_place == "Art Gallery":
		add_end = add_end + 1
	if Global.G_trust == 0:
		add_end = add_end + 1
		
	#Toby
	
	if Global.T_emotion == 0:
		add_end = add_end + 1
	if Global.T_connection == 1:
		add_end = add_end + 1
	if Global.T_crim == 0:
		add_end = add_end + 1
	if Global.T_violent == 0:
		add_end = add_end + 1
	if Global.T_place == "Luther St":
		add_end = add_end + 1
	if Global.T_trust == 0:
		add_end = add_end + 1
		
	#Panya
	
	if Global.P_emotion == 2:
		add_end = add_end + 1
	if Global.P_connection == 1:
		add_end = add_end + 1
	if Global.P_crim == 0:
		add_end = add_end + 1
	if Global.P_violent == 1:
		add_end = add_end + 1
	if Global.P_place == "Shotgun Rd":
		add_end = add_end + 1
	if Global.P_trust == 0:
		add_end = add_end + 1
		
	#Herald
	
	if Global.H_emotion == 2:
		add_end = add_end + 1
	if Global.H_connection == 1:
		add_end = add_end + 1
	if Global.H_crim == 0:
		add_end = add_end + 1
	if Global.H_violent == 0:
		add_end = add_end + 1
	if Global.H_place == "Park":
		add_end = add_end + 1
	if Global.H_trust == 0:
		add_end = add_end + 1
		
	#Riley
	
	if Global.R_emotion == 0:
		add_end = add_end + 1
	if Global.R_connection == 0:
		add_end = add_end + 1
	if Global.R_crim == 0:
		add_end = add_end + 1
	if Global.R_violent == 0:
		add_end = add_end + 1
	if Global.R_place == "":
		add_end = add_end + 1
	if Global.R_trust == 0:
		add_end = add_end + 1
		
	#Steph
	
	if Global.S_emotion == 0:
		add_end = add_end + 1
	if Global.S_connection == 0:
		add_end = add_end + 1
	if Global.S_crim == 0:
		add_end = add_end + 1
	if Global.S_violent == 0:
		add_end = add_end + 1
	if Global.S_place == "":
		add_end = add_end + 1
	if Global.S_trust == 0:
		add_end = add_end + 1
		
	print(add_end)
	Global.total = float(add_end) / 36.0 * 100.0
	print("ADD_END:", add_end)
	print("TOTAL:", Global.total)
	
	Global.total = add_end/36 * 100
	
	


func _on_yes_pressed() -> void:
	emit_signal("DONE")


func _on_submit_pressed() -> void:
	$areyousure.show()
