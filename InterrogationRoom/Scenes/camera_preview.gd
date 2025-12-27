extends Control
@onready var camera = $TemplateSize/Picture

#
@onready var park_5 = preload("res://images/camera/5_park.png")
@onready var park_520 = preload("res://images/camera/520_park.png")
@onready var park_540= preload("res://images/camera/540_park.png")
@onready var park_6 = preload("res://images/camera/6_park.png")
@onready var park_620 = preload("res://images/camera/620_park.png")
@onready var park_640 = preload("res://images/camera/640_park.png")
@onready var park_7 = preload("res://images/camera/7_park.png")
@onready var park_720 = preload("res://images/camera/720_park.png")
#
@onready var gallery_5 = preload("res://gallery/5.png")
@onready var gallery_520 = preload("res://gallery/52.png")
@onready var gallery_540= preload("res://gallery/54.png")
@onready var gallery_6 = preload("res://gallery/6.png")
@onready var gallery_620 = preload("res://gallery/62.png")
@onready var gallery_640 = preload("res://gallery/64.png")
@onready var gallery_7 = preload("res://gallery/7.png")
@onready var gallery_720 = preload("res://gallery/72.png")
#
@onready var houses_5 = preload("res://houses/1.png")
@onready var houses_520 = preload("res://houses/2.png")
@onready var houses_540= preload("res://houses/3.png")
@onready var houses_6 = preload("res://houses/4.png")
@onready var houses_620 = preload("res://houses/5.png")
@onready var houses_640 = preload("res://houses/6.png")
@onready var houses_7 = preload("res://houses/7.png")
@onready var houses_720 = preload("res://houses/8.png")
#
@onready var shops_5 = preload("res://clouds.png")
#

var textures

func _ready() -> void:
	self.hide()


enum State { empty, park, houses, gallery, shops }
var current_state : State = State.empty

func _on_slider_value_changed(value: float) -> void:
	
	if value == 5:
		textures = {
			State.park: park_5,
			State.houses: houses_5,
			State.gallery: gallery_5,
			State.shops: shops_5
		}
		
	elif value == 5.2:
		textures = {
			State.park: park_520,
			State.houses: houses_520,
			State.gallery: gallery_520,
			State.shops: shops_5
		}
	elif value == 5.4:
		textures = {
			State.park: park_540,
			State.houses: houses_540,
			State.gallery: gallery_540,
			State.shops: shops_5
		}
	elif value == 5.6:
		textures = {
			State.park: park_6,
			State.houses: houses_6,
			State.gallery: gallery_6,
			State.shops: shops_5
		}
	elif value == 5.8:
		textures = {
			State.park: park_620,
			State.houses: houses_620,
			State.gallery: gallery_620,
			State.shops: shops_5
		}
	elif value == 6:
		textures = {
			State.park: park_640,
			State.houses: houses_640,
			State.gallery: gallery_640,
			State.shops: shops_5
		}
	elif value == 6.2:
		textures = {
			State.park: park_7,
			State.houses: houses_7,
			State.gallery: gallery_7,
			State.shops: shops_5
		}
	elif value == 6.4:
		textures = {
			State.park: park_720,
			State.houses: houses_720,
			State.gallery: gallery_720,
			State.shops: shops_5
		}
	camera.texture = textures.get(current_state)
		
	

func _on_parks_pressed() -> void:
	current_state = State.park
	camera.texture = park_5
	self.show()


func _on_exit_pressed() -> void:
	current_state = State.empty
	$slider.value = 5.0
	self.hide()


func _on_camera_3_pressed() -> void:
	current_state = State.gallery
	camera.texture = gallery_5
	self.show()


func _on_camera_1_pressed() -> void:
	current_state = State.houses
	camera.texture = houses_5
	self.show()
