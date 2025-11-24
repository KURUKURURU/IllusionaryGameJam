extends Node2D

func _ready() -> void:
	$FileBook.hide()
	$CardZoom.hide()
	$BlackFade.hide()
	$AnimationPlayer.play("StartRoom/SlideIn")

func _process(delta: float) -> void:
	if $Object2/Files.is_hovered():
		$Label/Text.text = "View your case? [PRESS E]"
		
		if Input.is_action_just_pressed("space"): 
			_filebook()
	
	elif $FileBook.visible or $CardZoom.visible:
		$Label/Text.text = "[PRESS Q TO QUIT]"
		if Input.is_action_just_pressed("quit"): 
			$CardZoom.hide()
			$FileBook.hide()

			
	elif $Object/Card.is_hovered():
		$Label/Text.text = "View Card? [PRESS E]"
		
		if Input.is_action_just_pressed("space"): 
			_viewCard()
		
	elif !$Object2/Files.is_hovered() or !$Object2/Card.is_hovered():
		$Label/Text.text = ""

func ID_interact() -> void:
	$Object/Card.z_index = 1
	$Object2/Files.z_index = 0


func Files_interact() -> void:
	$Object/Card.z_index = 0
	$Object2/Files.z_index = 1

func _filebook():
	$Object/Card.z_index = 0
	$Object2/Files.z_index = 0
	
	$Object2/open.play()
	$FileBook.show()
	
func _viewCard():
	$Object/Card.z_index = 0
	$Object2/Files.z_index = 0
	
	$Object2/open.play()
	$CardZoom.show()


func _on_complete_pressed() -> void:
	$AnimationPlayer.play("Fade")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file("uid://cdu664noo2px5")
