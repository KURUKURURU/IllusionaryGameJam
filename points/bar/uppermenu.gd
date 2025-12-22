extends Node2D

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout

func _process(delta: float) -> void:
	if $SettingsPanel.visible:
		$color2.show()
	else:
		$color2.hide()

func _ready() -> void:
	$SettingsPanel.hide()
	$Board.hide()
	$color.hide()
	$color2.hide()
	
func _on_settings_pressed() -> void:
	$SettingsPanel.show()
	$color2.show()
	#$fade.play("s_on")
	
	$SettingsPanel/panel.play("still")
	$SettingsPanel/zoom.play("zoom in")
	$SettingsPanel.show()
	
	await wait(1.0)
	$SettingsPanel/panel.play("default")
	$SettingsPanel/SFXTest.play()

func _on_points_pressed() -> void:
	$Board.show()
	$color.show()
	
	$fade.play("b_op")


func _on_down_pressed() -> void:
	$fade.play("b_down")
	await $fade.animation_finished
	$Board.hide()
	$color.hide()
	
