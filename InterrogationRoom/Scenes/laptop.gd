extends Node2D
@onready var vicpage = $Object2/TestWindow/VictimPage
@onready var gregpage = $Object2/TestWindow/GregPage


func _ready() -> void:
	$MapPreview.hide()
	$CameraPortal.hide()
	$ImageWindow.hide()
	$Object2.hide()
	$Object/TestWindow/GregPage.hide()
	
	$Object/TestWindow/VictimPage.hide()
	$Object/TestWindow/ScrollContainer.hide()
	$Object/TestWindow/notes.show()
	
	$Object2/TestWindow/notes.hide()
	$Object2/TestWindow/ScrollContainer.hide()
	
	vicpage.show()
	

func Object1() -> void:
	$Object.z_index = 1
	$Object2.z_index = 0


func Object2() -> void:
	$Object.z_index = 0
	$Object2.z_index = 1


func _on_test_window_coolpressed() -> void:
	$Object2/TestWindow/notes.hide()
	$Object2/TestWindow/ScrollContainer.hide()
	
	vicpage.show()
	gregpage.hide()
	
	vicpage.scroll_vertical = 0
	$Object2/Popup.play("popup")
	$Object2.show()
	#
	#$Object.z_index = 0
	#$Object2.z_index = 1


func _on_test_window_bookmark_1() -> void:
	$Object2/TestWindow/ScrollContainer.hide()
	vicpage.scroll_vertical = 0
	vicpage.show()


func _on_test_window_homebutt() -> void:
	vicpage.hide()
	gregpage.hide()
	$Object2/TestWindow/ScrollContainer.show()
	$Object2/TestWindow/ScrollContainer.scroll_vertical = 0


func _on_hide_pressed() -> void:
	$Object3.hide()


func _on_maps_pressed() -> void:
	$Object3.show()



func IMG_Folder() -> void:
	pass


func _on_image_folder_image_signal() -> void:
	$ping.play()
	$ImageWindow/Popup.play("popup")
	$ImageWindow.show()
	$ImageWindow.z_index = 1
	$Object.z_index = 0
	$Object2.z_index = 0
	$CameraPortal.z_index = 0


func _on_hideMAP_pressed() -> void:
	$MapPreview.hide()


func _on_image_window_map_preview() -> void:
	$MapPreview.show()


func SecurityPortalActivation() -> void:
	$ping.play()
	$CameraPortal/Popup.play("popup")
	$CameraPortal.show()
	$CameraPortal.z_index = 1
	$Object.z_index = 0
	$Object2.z_index = 0
	$ImageWindow.z_index = 0


func _on_test_window_greg_page() -> void:
	$Object2.show()
	$Object2/TestWindow/notes.hide()
	$Object2/TestWindow/ScrollContainer.hide()
	vicpage.hide()
	
	$Object2/Popup.play("popup")
	gregpage.scroll_vertical = 0
	gregpage.show()
	
	
