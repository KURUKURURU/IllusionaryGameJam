extends Node2D
var startSwitch = false

func _process(delta: float) -> void:
	if $Node2D/Table/FilesNotes.is_hovered():
		if Input.is_action_just_pressed("space"):
			$Node2D/Table/FilesNotes/open.play()
			$FileBook.show()
	
	if $FileBook.visible:
		$Label/Text.text = "[PRESS Q TO QUIT]"
		if Input.is_action_just_pressed("quit"):
			$FileBook.hide()

func _ready() -> void:
	$Label/Text.text = ""
	$UP.hide()
	$FileBook.hide()
	$DOWN.show()


func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
	
func Down() -> void:

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


func files_mousetouch() -> void:
	$Label/Text.text = "Review Case? [PRESS E]"
	

func files_mouseleave() -> void:
	$Label/Text.text = ""
