extends Node2D
@export var tag: String
@export var path: String

func _ready() -> void:
	var abs_path = path
	
	$video.stream = load(abs_path)
	$video.play()
	
	$unpause.hide()
	$tag.text = tag

func _on_pause_pressed() -> void:
	$video.paused = true
	$pause.hide()
	$unpause.show()


func _on_unpause_pressed() -> void:
	$video.paused = false
	$pause.show()
	$unpause.hide()
