extends Control

var add_end = 0

#func emotion_set(index: int) -> void:
	#if index == 0:
		


func _on_save_pressed() -> void:
	
	#add_end = 0
	#
	#if $emotion.selected == 0:
		#add_end = add_end + 1
	#if $connection.selected == 0:
		#add_end = add_end + 1
	#if $crim.selected == 0:
		#add_end = add_end + 1
	#if $violent.selected == 0:
		#add_end = add_end + 1
	#if $place.text == "":
		#add_end = add_end + 1
	#if $trust.selected == 0:
		#add_end = add_end + 1
		#
	#print(add_end)
	
	Global.H_emotion = $emotion.get_selected_id()
	Global.H_connection = $connection.get_selected_id()
	Global.H_crim = $crim.get_selected_id()
	Global.H_violent = $violent.get_selected_id()
	Global.H_trust = $trust.get_selected_id()
	Global.H_place = $place.text
