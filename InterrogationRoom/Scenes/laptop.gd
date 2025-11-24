extends Node2D

func _ready() -> void:
	$Object2.hide()


func Object1() -> void:
	$Object.z_index = 1
	$Object2.z_index = 0


func Object2() -> void:
	$Object.z_index = 0
	$Object2.z_index = 1


func _on_test_window_coolpressed() -> void:
	$Object2/Popup.play("popup")
	$Object2.show()
	
	$Object.z_index = 0
	$Object2.z_index = 1
