extends Node2D


func SFXTest() -> void:
	$SFXTest.play()


func exitPanel() -> void:
	$SFXTest.stop()
	$MusicTest.stop()
	self.hide()
