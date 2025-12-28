extends Node2D

var correct

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
	
	#$'2'/Report_Transfer/slide.play("slide")
	$'2'.show()
	
	
	
func _process(delta: float) -> void:
	
	$tab_1/grade.text = str(Global.total) + "%"
	
	
	if correct: 
		$tab_2/ACCURATE.text = "succeeded"
	else:
		$tab_2/ACCURATE.text = "failed"
	
	
	if Global.total > 60:
		$tab_1/decription.text = "You assessed their alibis and records effectively and accurately."
	else:
		$tab_1/decription.text = "You failed to assess their alibis and records effectively and accurately."
	
	if $"2/Report_Transfer/Greg/SAVE".disabled \
	or $"2/Report_Transfer/Toby/SAVE".disabled \
	or $"2/Report_Transfer/Panya/SAVE".disabled \
	or $"2/Report_Transfer/Herald/SAVE".disabled:
	#and !$"2/Report_Transfer/Riley/SAVE".disabled \
	#and !$"2/Report_Transfer/Steph/SAVE".disabled \
		$"2/Report_Transfer/submit".disabled = false
	else:
		$"2/Report_Transfer/submit".disabled = false  #####change please


func _on_report_transfer_done() -> void:
	#$"2/Report_Transfer/slide".play("slide_out")
	#await $"2/Report_Transfer/slide".animation_finished
	$'2'.hide()
	$finalwarning.hide()
	
	$WHO/slide.play("slide_2")
	$WHO.show()
	
	


func DoneAccused() -> void:
	$"WHO/slide".play("slide_out")
	await $"WHO/slide".animation_finished
	$"WHO".hide()
	#67
	if $WHO/WHO.selected == 4:
		correct = true
	else:
		correct = false
	
	$tab_1/slide.play("slide") 
	$tab_2/slide.play("slide")
	
	$tab_1.show()
	$tab_2.show()


func _on_who_item_selected(index: int) -> void:
	$WHO/facecard_accuse/greg.hide()
	$WHO/facecard_accuse/tanya.hide()
	$WHO/facecard_accuse/riley.hide()
	$WHO/facecard_accuse/toby.hide()
	$WHO/facecard_accuse/steph.hide()
	$WHO/facecard_accuse/herald.hide()
	
	$tab_2/facecard_accuse/greg.hide()
	$tab_2/facecard_accuse/tanya.hide()
	$tab_2/facecard_accuse/riley.hide()
	$tab_2/facecard_accuse/toby.hide()
	$tab_2/facecard_accuse/steph.hide()
	$tab_2/facecard_accuse/herald.hide()
	
	if index == 0:
		$WHO/facecard_accuse/greg.show()
	elif index == 1:
		$WHO/facecard_accuse/toby.show()
	elif index == 2:
		$WHO/facecard_accuse/tanya.show()
	elif index == 3:
		$WHO/facecard_accuse/herald.show()
	elif index == 4:
		$WHO/facecard_accuse/riley.show()
	elif index == 5:
		$WHO/facecard_accuse/steph.show()

	if index == 0:
		$tab_2/facecard_accuse/greg.show()
	elif index == 1:
		$tab_2/facecard_accuse/toby.show()
	elif index == 2:
		$tab_2/facecard_accuse/tanya.show()
	elif index == 3:
		$tab_2/facecard_accuse/herald.show()
	elif index == 4:
		$tab_2/facecard_accuse/riley.show()
	elif index == 5:
		$tab_2/facecard_accuse/steph.show()
