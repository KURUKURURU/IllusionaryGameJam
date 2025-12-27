extends Node2D

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout

func  _ready() -> void:
	$"2/Report_Transfer/InteractMove".disabled = true
	
	$finalwarning/slide.play("slide")
	$finalwarning.show()
	await wait(6.0)
	$finalwarning/slide.play("slide_out")
	
	await $finalwarning/slide.animation_finished
	$finalwarning.hide()
	
	await wait(2.0)
	
	$'2'/Report_Transfer/slide.play("slide")
	$'2'.show()
	
func _process(delta: float) -> void:
	
	if $"2/Report_Transfer/Greg/SAVE".disabled \
	or $"2/Report_Transfer/Toby/SAVE".disabled \
	or $"2/Report_Transfer/Panya/SAVE".disabled \
	or $"2/Report_Transfer/Herald/SAVE".disabled:
	#and !$"2/Report_Transfer/Riley/SAVE".disabled \
	#and !$"2/Report_Transfer/Steph/SAVE".disabled \
		$"2/Report_Transfer/submit".disabled = true
	else:
		$"2/Report_Transfer/submit".disabled = false
