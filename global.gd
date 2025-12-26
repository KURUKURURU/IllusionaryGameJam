extends Node

var greg_saved: bool = false
var toby_saved: bool = false
var panya_saved: bool = false

var greg_cp = 5
var toby_cp = 3
var panya_cp = 3
var green_cp = 3
var riley_cp = 0
var steph_cp = 0

func _process(delta: float) -> void:
	if greg_cp >5:
		greg_cp = 5
	if toby_cp >5:
		toby_cp = 5
	if panya_cp >5:
		panya_cp = 5
	if green_cp >5:
		green_cp = 5
