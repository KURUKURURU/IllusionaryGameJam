extends Node2D

func _ready() -> void:
	$point_add.hide()
	$point_remove.hide()

func add_point():
	$point_add.show()
	$fade.play("add")
	$coin.play()
	
	await $fade.animation_finished
	$point_add.hide()
	
func remove_point():
	$point_remove.show()
	$fade.play("remove")
	$losecoin.play()
	
	await $fade.animation_finished
	$point_remove.hide()
