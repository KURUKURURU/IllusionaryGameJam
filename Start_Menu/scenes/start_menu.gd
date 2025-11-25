extends Node2D
@onready var label = $Label/Text
#@onready var Brief_open = load("res://Start_Menu/images/suitcase/armored-business-case-money-open-top-down-white-background-isolated-160765169.webp")
#@onready var Brief_closed = load("res://Start_Menu/images/suitcase/closed-black-leather-briefcase-isolated-600nw-1807081060.webp")


func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout



func _ready() -> void:
	$Briefcase.play("close")
	$Label/ColorRect.hide()
	$Label/Text.add_theme_color_override("default_color", Color(0.0, 0.0, 0.0, 1.0))
	$SettingsPanel.hide()
	
	label.text = ""
	_closeHandle()
	
	
	

#    "Handle" interactions
#

func mousetouch_handle() -> void:
	label.text = "Open?"
func mouseleave_handle() -> void:
	label.text = ""
func click_handle() -> void:
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
	label.text = "Settings"
func settings_mouseleave() -> void:
	label.text = ""

#
func _settings_show() -> void:
	$SettingsPanel.show()
	if $SettingsPanel.visible:
		if !$SettingsPanel/MusicTest.is_playing():
			$SettingsPanel/MusicTest.play()
		
	


#     "Start" interactions
#
func Start_mousetouch() -> void:
	label.text = "Start game?"
func Start_mouseleave() -> void:
	label.text = ""
	
#
func StartGame() -> void:
	get_tree().change_scene_to_file("uid://b1w8iudqm0htd")
