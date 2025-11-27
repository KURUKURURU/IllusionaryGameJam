extends Node2D
@onready var label = $Label/Text
#@onready var Brief_open = load("res://Start_Menu/images/suitcase/armored-business-case-money-open-top-down-white-background-isolated-160765169.webp")
#@onready var Brief_closed = load("res://Start_Menu/images/suitcase/closed-black-leather-briefcase-isolated-600nw-1807081060.webp")


func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout

func _process(delta: float) -> void:
	if !$SettingsPanel.visible:
		$SettingsPanel/SFXTest.stop()

func _ready() -> void:
	$Credits.hide()
	$Briefcase.play("close")
	$Label/ColorRect.hide()
	$Label/Text.add_theme_color_override("default_color", Color(0.897, 0.51, 0.299, 1.0))
	$SettingsPanel.hide()
	
	label.text = ""
	_closeHandle()
	
	
	

#    "Handle" interactions
#

func mousetouch_handle() -> void:
	label.text = "Open?"
	$SettingsPanel/click.play()
func mouseleave_handle() -> void:
	label.text = ""
func click_handle() -> void:
	$GeneralClick.play()
	_openHandle()
	
	
#

func _openHandle(): 
	$Briefcase/Handle.hide()
	
	#await wait(0.75)
	$Briefcase/click.play()
	await wait(0.25)
	$Briefcase.play("open")
	
	await $Briefcase.animation_finished
	$Briefcase.stop()
	$Briefcase.play("default")
	$Node2D.show()
	
func _closeHandle():
	$Node2D.hide()
	
	$Briefcase/Handle.show()
	$Briefcase.play("close")





#    "Settings" interactions
#
func settings_mousetouch() -> void:
	$GeneralClick.play()
	label.text = "Settings"
func settings_mouseleave() -> void:
	label.text = ""

#
func _settings_show() -> void:
	$Node2D/Settings/click.play()
	$SettingsPanel/panel.play("still")
	$SettingsPanel/zoom.play("zoom in")
	$SettingsPanel.show()
	
	await wait(1.0)
	$SettingsPanel/panel.play("default")
	$SettingsPanel/SFXTest.play()
	
	
	if $SettingsPanel.visible:
		if !$SettingsPanel/MusicTest.is_playing():
			$SettingsPanel/MusicTest.play()
		
	


#     "Start" interactions
#
func Start_mousetouch() -> void:
	label.text = "Start game?"
	$GeneralClick.play()
func Start_mouseleave() -> void:
	label.text = ""
	
#
func StartGame() -> void:
	$Node2D/Start/pageturn.play()
	$Briefcase.play("finished")
	$MusicFade.play("musicfade")
	$Node2D.hide()
	
	$Briefcase/shut.play()
	await $Briefcase.animation_finished
	$Briefcase/click.play()
	
	await wait(2.0)
	$Briefcase.stop()
	
	get_tree().change_scene_to_file("uid://bdjuf601y1m00")


func _on_credits_mouse_entered() -> void:
	label.text = "Credits"
	$GeneralClick.play()


func _on_put_down_pressed() -> void:
	$Node2D/Settings/click.play()
	$Node2D/Start/pageturn.play()
	$Credits.hide()


func _on_credits_pressed() -> void:
	$Node2D/Start/pageturn.play()
	$Credits.show()


func _on_put_down_mouse_entered() -> void:
	$GeneralClick.play()


func _on_credits_mouse_exited() -> void:
	label.text = ""
