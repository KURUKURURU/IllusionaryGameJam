extends Node2D
@onready var vicpage = $Object2/TestWindow/VictimPage


func _ready() -> void:
	$Object2.hide()
	
	$Object/TestWindow/VictimPage.hide()
	$Object/TestWindow/ScrollContainer.hide()
	$Object/TestWindow/notes.show()
	
	$Object2/TestWindow/notes.hide()
	$Object2/TestWindow/ScrollContainer.show()
	vicpage.hide()
	

func Object1() -> void:
	$Object.z_index = 1
	$Object2.z_index = 0


func Object2() -> void:
	$Object.z_index = 0
	$Object2.z_index = 1


func _on_test_window_coolpressed() -> void:
	$Object2/Popup.play("popup")
	$Object2.show()
	#
	#$Object.z_index = 0
	#$Object2.z_index = 1


func _on_test_window_bookmark_1() -> void:
	$Object2/TestWindow/ScrollContainer.hide()
	vicpage.show()


func _on_test_window_homebutt() -> void:
	vicpage.hide()
	$Object2/TestWindow/ScrollContainer.show()


func _on_hide_pressed() -> void:
	$Object3.hide()


func _on_maps_pressed() -> void:
	$Object3.show()
