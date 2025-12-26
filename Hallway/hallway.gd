extends Node2D

@onready var audio_bus_layout = preload("res://default_bus_layout.tres")

func _ready() -> void:
	AudioServer.set_bus_layout(audio_bus_layout)

func GregPath() -> void:
	if !Global.greg_saved:
		get_tree().change_scene_to_file("uid://bdycqhfyd38af")
		return
	
	$bing.play()

func TobyPath() -> void:
	if !Global.toby_saved && Global.greg_saved:
		get_tree().change_scene_to_file("uid://j3tclxiknunw")
		return
	
	$bing.play()

func PanyaPath() -> void:
	if !Global.panya_saved && Global.greg_saved && Global.toby_saved:
		get_tree().change_scene_to_file("uid://dil28dp02varo")
		return
	
	$bing.play()
	
func GreenPath() -> void:
	if !Global.green_saved && Global.greg_saved && Global.toby_saved && Global.panya_saved:
		get_tree().change_scene_to_file("uid://d23pckgwjyxuc")
		return
	
	$bing.play()
