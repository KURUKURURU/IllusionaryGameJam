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
@onready var houses_5 = preload("res://clouds.png")
#
@onready var gallery_5 = preload("res://clouds.png")
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
			State.houses: houses_5,
			State.gallery: gallery_5,
			State.shops: shops_5
		}
	elif value == 5.4:
		textures = {
			State.park: park_540,
			State.houses: houses_5,
			State.gallery: gallery_5,
			State.shops: shops_5
		}
	elif value == 5.6:
		textures = {
			State.park: park_6,
			State.houses: houses_5,
			State.gallery: gallery_5,
			State.shops: shops_5
		}
	elif value == 5.8:
		textures = {
			State.park: park_620,
			State.houses: houses_5,
			State.gallery: gallery_5,
			State.shops: shops_5
		}
	elif value == 6:
		textures = {
			State.park: park_640,
			State.houses: houses_5,
			State.gallery: gallery_5,
			State.shops: shops_5
		}
	elif value == 6.2:
		textures = {
			State.park: park_7,
			State.houses: houses_5,
			State.gallery: gallery_5,
			State.shops: shops_5
		}
	elif value == 6.4:
		textures = {
			State.park: park_720,
			State.houses: houses_5,
			State.gallery: gallery_5,
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
