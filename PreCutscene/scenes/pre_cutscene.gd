extends Node2D

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
	
func _ready() -> void:
	
	
	$Next.hide()
	$th/ani.play("default")
	await wait(4.0)
	$hit.play()
	
	await wait(2.0)
	$hit.play()
	
	await wait(8.0)
	$gasp.play()
	
	await wait(2.0)
	$fade.play("fade")
	
	await $fade.animation_finished
	get_tree().change_scene_to_file("uid://b1w8iudqm0htd")

func _on_next_pressed() -> void:
	get_tree().change_scene_to_file("uid://b1w8iudqm0htd")
