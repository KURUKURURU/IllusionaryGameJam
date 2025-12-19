extends Node2D
@onready var audio_bus_layout = preload("res://hallway.tres")

# change this lATERRETETRRR
@onready var hover_door = preload("res://PreCutscene/frames/box/ph/wal2.png")
@onready var normal_door = preload("res://PreCutscene/frames/box/ph/walll1.png")
#@onready var hover_question = preload("res://security-camera-icon-video-surveillance-600nw-2498783595.webp")
##

var startSwitch = false
var scroll = true
var fin_ani = false
var enable = true

signal intro
signal questioning_1


func _process(delta: float) -> void:
	
	if !$Laptop.visible && !$GregTalkingScene.visible:
		enable = true
	if $GregTalkingScene.visible:
		$Label.hide()
		enable = false
	
	if $UP.is_hovered():
		$Label/Text.text = "Look up?"
	if $DOWN.is_hovered():
		$Label/Text.text = "Look down?"
	if $Node2D/Table/Ipad.is_hovered():
		$Label/Text.text = "View additonal evidence? [CLICK]"
		
		#if Input.is_action_just_pressed("space"):
			#$Laptop.show()
		
	elif !$DOWN.is_hovered() and !$UP.is_hovered() and  !$Node2D/Table/FilesNotes.is_hovered() and !$Node2D/Table/Ipad.is_hovered() and !$Node2D/door.is_hovered():
		$Label/Text.text = ""
	
	if $Node2D/Table/FilesNotes.is_hovered():
		if Input.is_action_just_pressed("space"):
			$Node2D/Table/FilesNotes/open.play()
			$FileBook.show()
	
	if $Laptop.visible:
		enable = false
		$Laptop/CanvasLayer/bott.show()
		if Input.is_action_just_pressed("click"):
			$Click.play()
		
		$MainMusic.stop()
		
		if !$CompMusic.playing:
			$CompMusic.play()
		
		$Label/Text.text = "[PRESS ESC TO QUIT]"
		$Label/ColorRect.color = Color(0.0, 0.0, 0.46, 1.0)
		if Input.is_action_just_pressed("esc"):
			$Laptop.hide()
		
	elif !$Laptop.visible:
		
		$Laptop/CanvasLayer/bott.hide()
		$CompMusic.stop()
		if !$MainMusic.playing:
			$MainMusic.play()
			
		$Label/ColorRect.color = Color(0.0, 0.0, 0.0, 1.0)
	
	if $FileBook.visible:
		$Label/Text.text = "[PRESS ESC TO QUIT]"
		if Input.is_action_just_pressed("esc"):
			$FileBook.hide()
			$Label/Text.text = ""
			
	if Input.is_action_just_pressed("scrollup") && !scroll && fin_ani && enable:
		$UP.hide()
		#$DOWN.show()
		$AnimationPlayer.play("sliding/up")
		$Whoosh.play()
		
		scroll = true
		
	if Input.is_action_just_pressed("scrolldown") && scroll && enable:
		
		#$UP.show()
		$DOWN.hide()
		$AnimationPlayer.play("sliding/down")
		$Whoosh.play()
		scroll = false
		
		if !startSwitch:
	
			await wait(0.5)
			
			$AnimationPlayer.play("sliding/items")
			$Node2D/Table/FilesNotes/paper.play()
			
			await $AnimationPlayer.animation_finished
			fin_ani = true
			
			startSwitch = true
		
func _ready() -> void:
	
	$'Node2D/greg/intro'.show()
	$Node2D/greg/question.hide()
	
	#$Node2D/greg/question.texture_hover = hover_intro
	AudioServer.set_bus_layout(audio_bus_layout)
	$Label/Text.text = ""
	
	$GregTalkingScene.hide()
	$FileBook.hide()
	$Laptop.hide()
	#$TalkingBox.hide()
	#$Node2D/girl/Control/GirlTalkBox.hide()
	
func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
	
func Down() -> void:
	$Whoosh.play()
	$AnimationPlayer.play("sliding/down")
	
	await $AnimationPlayer.animation_finished
	
	if !startSwitch:
	
		await wait(0.5)
		
		$AnimationPlayer.play("sliding/items")
		$Node2D/Table/FilesNotes/paper.play()
		startSwitch = true

func UP() -> void:
	
	$AnimationPlayer.play("sliding/up")
	$Whoosh.play()

func files_mousetouch() -> void:
	$Label/Text.text = "Review Case? [CLICK]"

func files_mouseleave() -> void:
	$Label/Text.text = ""

func IfStartTalking() -> void:
	
	$Label.hide()
	$Node2D/greg/intro.hide()
	$GregTalkingScene.show()
	
	#$Node2D/greg/question.texture_hover = hover_question
	$Node2D/greg/question.show()
	emit_signal("intro")	
	
func question_witness() -> void:
	emit_signal("questioning_1")

func alldone_connect() -> void:
	$GregTalkingScene.hide()
	$Label.show()

func _on_ipad_pressed() -> void:
	$Laptop.show()

func _on_files_notes_pressed() -> void:
	$FileBook.show()


func _on_door_mouse_exited() -> void:
	$Label/Text.text = ""
	$Node2D/TextureRect2.texture = normal_door


func _on_door_mouse_entered() -> void:
	if Global.greg_saved:
		$Label/Text.text = "Leave?"
	else:
		$Label/Text.text = "Complete your report!"
	$Node2D/TextureRect2.texture = hover_door


func Leave() -> void:
	if Global.greg_saved:
		get_tree().change_scene_to_file("uid://b4rgvrr0gjroo")
	else:
		$bing.play()
