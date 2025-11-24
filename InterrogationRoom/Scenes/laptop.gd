extends Node2D

func Object1() -> void:
	$Object.z_index = 1
	$Object2.z_index = 0


func Object2() -> void:
	$Object.z_index = 0
	$Object2.z_index = 1
