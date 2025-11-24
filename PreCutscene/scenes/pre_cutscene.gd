extends Node2D

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
	
func _ready() -> void:
	await wait(3.0)
	get_tree().change_scene_to_file("uid://cdu664noo2px5")
