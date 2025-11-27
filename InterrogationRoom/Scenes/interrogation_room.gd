extends Node2D
var startSwitch = false

func _process(delta: float) -> void:
	if $UP.is_hovered():
		$Label/Text.text = "Look up?"
	if $DOWN.is_hovered():
		$Label/Text.text = "Look down?"
	if $Node2D/Table/Ipad.is_hovered():
		$Label/Text.text = "View additonal evidence? [PRESS E]"
		
		if Input.is_action_just_pressed("space"):
			$Laptop.show()
		
	elif !$DOWN.is_hovered() and !$UP.is_hovered() and  !$Node2D/Table/FilesNotes.is_hovered() and !$Node2D/Table/Ipad.is_hovered():
		$Label/Text.text = ""
	
	if $Node2D/Table/FilesNotes.is_hovered():
		if Input.is_action_just_pressed("space"):
			$Node2D/Table/FilesNotes/open.play()
			$FileBook.show()
	
	if $Laptop.visible:
		$Laptop/CanvasLayer/bott.show()
		if Input.is_action_just_pressed("click"):
			$Click.play()
		
		$MainMusic.stop()
		
		if !$CompMusic.playing:
			$CompMusic.play()
		
		$Label/Text.text = "[PRESS Q TO QUIT]"
		$Label/ColorRect.color = Color(0.0, 0.0, 0.46, 1.0)
		if Input.is_action_just_pressed("quit"):
			$Laptop.hide()
		
	elif !$Laptop.visible:
		$Laptop/CanvasLayer/bott.hide()
		$CompMusic.stop()
		if !$MainMusic.playing:
			$MainMusic.play()
			
		$Label/ColorRect.color = Color(0.0, 0.0, 0.0, 1.0)
	
	if $FileBook.visible:
		$Label/Text.text = "[PRESS Q TO QUIT]"
		if Input.is_action_just_pressed("quit"):
			$FileBook.hide()
			$Label/Text.text = ""

func _ready() -> void:
	$Label/Text.text = ""
	$UP.hide()
	$FileBook.hide()
	$Laptop.hide()
	$TalkingBox.hide()
	$Node2D/girl/Control/GirlTalkBox.hide()
	$DOWN.show()


func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
	
func Down() -> void:
	$Whoosh.play()
	$AnimationPlayer.play("sliding/down")
	
	await $AnimationPlayer.animation_finished
	$UP.show()
	$DOWN.hide()
	
	if !startSwitch:
	
		await wait(0.5)
		
		$AnimationPlayer.play("sliding/items")
		$Node2D/Table/FilesNotes/paper.play()
		startSwitch = true


func UP() -> void:
	
	$UP.hide()
	$DOWN.show()
	$AnimationPlayer.play("sliding/up")
	$Whoosh.play()

func files_mousetouch() -> void:
	$Label/Text.text = "Review Case? [PRESS E]"
	

func files_mouseleave() -> void:
	$Label/Text.text = ""


func IfStartTalking() -> void:
	$TalkingBox.show()
	$TalkingBox/AnimationPlayer.play("talking")
	await wait(4.0)
	$TalkingBox.hide()
	
