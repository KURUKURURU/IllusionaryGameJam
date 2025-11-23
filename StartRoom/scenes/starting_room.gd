extends Node2D

func _ready() -> void:
	$AnimationPlayer.play("StartRoom/SlideIn")


func ID_interact() -> void:
	$Object/Card.z_index = 1
	$Object2/Files.z_index = 0


func Files_interact() -> void:
	$Object/Card.z_index = 0
	$Object2/Files.z_index = 1
