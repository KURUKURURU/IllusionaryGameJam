extends Control



func _on_who_item_selected(index: int) -> void:
	
	$facecard_accuse/greg.hide()
	$facecard_accuse/tanya.hide()
	$facecard_accuse/riley.hide()
	$facecard_accuse/toby.hide()
	$facecard_accuse/steph.hide()
	$facecard_accuse/herald.hide()
	
	if index == 0:
		$facecard_accuse/greg.show()
	elif index == 1:
		$facecard_accuse/toby.show()
	if index == 2:
		$facecard_accuse/tanya.show()
	if index == 3:
		$facecard_accuse/herald.show()
	if index == 4:
		$facecard_accuse/riley.show()
	if index == 5:
		$facecard_accuse/steph.show()
