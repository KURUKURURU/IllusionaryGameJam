extends Node2D

func _ready() -> void:
	$unpause.hide()

func _on_pause_pressed() -> void:
	$video.paused = true
	$pause.hide()
	$unpause.show()


func _on_unpause_pressed() -> void:
	$video.paused = false
	$pause.show()
	$unpause.hide()
