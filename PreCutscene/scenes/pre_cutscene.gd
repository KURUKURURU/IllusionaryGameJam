extends Node2D

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
	
func _ready() -> void:
	
	
	$Next.hide()
	await wait(12.0)
	get_tree().change_scene_to_file("uid://b1w8iudqm0htd")

func _on_next_pressed() -> void:
	get_tree().change_scene_to_file("uid://b1w8iudqm0htd")
