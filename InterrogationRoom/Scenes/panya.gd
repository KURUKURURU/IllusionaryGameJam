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
	
	print("VALUE:", Global.G_emotion, "TYPE:", typeof(Global.G_emotion))
	print("ITEMS:", $Report_Transfer/Panya/emotion.item_count)
	
	
	Global.P_emotion = $emotion.get_selected_id()
	Global.P_connection = $connection.get_selected_id()
	Global.P_crim = $crim.get_selected_id()
	Global.P_violent = $violent.get_selected_id()
	Global.P_trust = $trust.get_selected_id()
	Global.P_place = $place.text
