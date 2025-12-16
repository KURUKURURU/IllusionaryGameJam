extends Control
@onready var camera = $TemplateSize/Picture

#
@onready var park_5 = preload("res://images/testing/1.png")
@onready var park_6 = preload("res://images/testing/2.png")
@onready var park_7 = preload("res://images/testing/3.png")
@onready var park_729 = preload("res://clouds.png")
#
@onready var houses_5 = preload("res://clouds.png")
#
@onready var gallery_5 = preload("res://clouds.png")
#
@onready var shops_5 = preload("res://clouds.png")
#

func _ready() -> void:
	self.hide()


enum State { empty, park, houses, gallery, shops }
var current_state : State = State.empty

func _on_slider_value_changed(value: float) -> void:
	
	if value < 6:
		if current_state == State.park:
			camera.texture = park_5
		if current_state == State.houses:
			camera.texture = houses_5
		if current_state == State.gallery:
			camera.texture = gallery_5
		if current_state == State.shops:
			camera.texture = shops_5
			
	elif value < 7:
		if current_state == State.park:
			camera.texture = park_6
			
	elif value < 7.27:
		if current_state == State.park:
			camera.texture = park_7
			
	

func _on_parks_pressed() -> void:
	current_state = State.park
	camera.texture = park_5
	self.show()


func _on_exit_pressed() -> void:
	current_state = State.empty
	$slider.value = 5.0
	self.hide()
