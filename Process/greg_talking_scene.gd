extends Node2D

@onready var W_txt = $Main/Text
@onready var Y_txt = $You/Text

@onready var W_ani = $ani
@onready var Y_ani = $You/AnimationPlayer

@onready var Y_AD = $You/advancebutt

@onready var op1 = $Options/Option1
@onready var op1_text = $Options/Option1/Text

@onready var op2 = $Options/Option2
@onready var op2_text = $Options/Option2/Text

@onready var op3 = $Options/Option3
@onready var op3_text = $Options/Option3/Text

var knows_shes_dead = false
var knows_shes_cute = false
var knows_shes_boring = false

var mg
signal Y_advance
signal done
signal done_op

#signal Greg_name
#signal Greg_where
#signal Greg_interest

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout

func introduce():
	Y_AD.hide()
	$You.show()
	$Main.hide()
	$Options.hide()
	
	$"You/pop up".play("pop")
	await $"You/pop up".animation_finished
	
	Y_txt.text = ""
	await say("Good evening.", 2.0)
	await say("I'm Detective Ward, and I'm investigating a crime that took place near 
	you tonight.", 5.0)
	await say("That's why you're here– you're going to give your statement.", 4.0)
	
	
	await Wit_say("Uhh,", 0.0)
	await Wit_say("I'm like, not even aware of what happened.", 4.0) 
	await Wit_say("I do know it's a chick. She pretty?", 3.0)
	
	alldone()
func _on_interrogation_room_questioning_1() -> void:
	Y_AD.hide()
	$You.hide()
	$Main.hide()
	$Options.hide()
	self.show()
	
	Wit_say("What would you need to know?", 100)
	
	op1_text.text = "How well do you know Megan Camargo?"
	op2_text.text = "Where were you at 7:30?"
	op3_text.text = "Why are you interested in the victim's looks?"
	
	$Options.show()
	
	
func say(message, num):
	
	Y_txt.text = ""
	Y_txt.text = message
	
	Y_ani.play("talking")
	$You.show()
	
	await Y_ani.animation_finished
	print(num)
	Y_AD.show()
	
	$You/clickicon.show()
	$You/AnimationPlayer.play("fadein")
	
	
	await Y_advance
	
	$You/clickicon.hide()
	$You.hide()
	Y_AD.hide()
	
func Wit_say(message, num):
	
	W_txt.text = ""
	W_txt.text = message
	
	$Main.show()
	
	await vis()
	
	if num == 100:
		await done_op
	else:
		await wait(num)
	
	$Main.hide()


func vis():
	W_ani.play("W_reveal")
	await W_ani.animation_finished
	
func Y_AD_pressed() -> void:
	emit_signal("Y_advance")

func alldone():
	emit_signal("done")



func _on_greg_name() -> void:
	
	print("ahhhhhhh")
	emit_signal("done_op")
	$Options.hide()
	
	if !knows_shes_dead:
		await Wit_say("Never heard of her. She dead?", 2.0)
		await Wit_say("Woah, really! Jeez.", 2.0)
		await Wit_say("Well, at least I didn't know her.", 2.0)
		knows_shes_dead = true
	elif knows_shes_dead:
		await Wit_say("Didn't know her.", 2.0)
	
	alldone()
