extends Node2D
@onready var audio_bus_layout = preload("res://default_bus_layout.tres")

func _ready() -> void:
	AudioServer.set_bus_layout(audio_bus_layout)

func GregPath() -> void:
	if !Global.greg_saved:
		get_tree().change_scene_to_file("uid://bdycqhfyd38af")
	elif Global.greg_saved:
		$bing.play()
