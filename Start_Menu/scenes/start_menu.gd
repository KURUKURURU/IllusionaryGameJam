extends Node2D
@onready var label = $Label/Text
#@onready var Brief_open = load("res://Start_Menu/images/suitcase/armored-business-case-money-open-top-down-white-background-isolated-160765169.webp")
#@onready var Brief_closed = load("res://Start_Menu/images/suitcase/closed-black-leather-briefcase-isolated-600nw-1807081060.webp")

func _ready() -> void:
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
	$Briefcase/Texture.play("Briefcase/open")
	
	$Node2D.show()
	
func _closeHandle():
	$Node2D.hide()
	
	$Briefcase/Handle.show()
	$Briefcase/Texture.play("Briefcase/close")





#    "Settings" interactions
#
func settings_mousetouch() -> void:
	label.text = "Settings"
func settings_mouseleave() -> void:
	label.text = ""

#
func _settings_show() -> void:
	pass
