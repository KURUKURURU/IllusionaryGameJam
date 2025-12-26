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
var told_where = false

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
	
func _on_interrogation_room_questioning_1() -> void:
	Y_AD.hide()
	$You.hide()
	$Main.hide()
	$Options.hide()
	self.show()
	
	Wit_say("...", 100)
	
	op1_text.text = "How close were you two?"
	op2_text.text = "Where were you at 7:30?"
	op3_text.text = "What's your full name? For the report."
	op3.hide()
	
	$Options.show()
	
	
func say(message, num):
	
	Y_txt.text = ""
	
	
	Y_ani.play("talking")
	$You.show()
	
	Y_txt.text = message
	await Y_ani.animation_finished
	print(num)
	Y_AD.show()
	
	
	$You/AnimationPlayer.play("fadein")
	$You/clickicon.show()
	
	await Y_advance
	
	$You/clickicon.hide()
	$You.hide()
	Y_AD.hide()
	
func Wit_say(message, num):
	
	W_txt.text = ""
	
	$Main.show()
	
	$Main/personality.play("popup")
	await $Main/personality.animation_finished
	$bing.play()
	
	W_txt.text = message
	
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
		await Wit_say("We were like sisters.", 3.0)
		await Wit_say("I can't believe she's dead. We were just together two hours ago...", 4.0)
		await Wit_say("...and now she's gone.", 4.0)
		
		$Connection.show()
		await Wit_say("Whoever did this...", 100)
		
	elif knows_shes_dead:
		$Work.show()
		await Wit_say("We were just shopping hours ago.", 2.0)
		await Wit_say("...", 0)
		
		$Connection.show()
		await Wit_say("I think I'm going to throw up.", 100)
		
	
	alldone()

func where_greg() -> void:
	
	emit_signal("done_op")
	$Options.hide()
	
	Y_txt.text = ""
	Y_AD.hide()
	$You.show()
	$Main.hide()
	$Options.hide()
	
	$"You/pop up".play("pop")
	await $"You/pop up".animation_finished
	await say("I just need to figure out where you were, basic procedure.", 0)
	
	if told_where: 
		await Wit_say("..", 0)
		await Wit_say("I was biking home on Shotgun Rd.", 3)
		await Wit_say("Meg took a shortcut through the park cuz' she lives in Housing Block 1.", 3)
	if !told_where:
		await Wit_say("I was biking home, cuz' I live past Luther Street.", 2.0)
		await Wit_say("Megan had felt like, um.. getting air. She wanted to clear her head in the park.", 3.0)
		await Wit_say("She's done it a bunch of times before.", 2.0)
		await Wit_say("Not even a scratch.", 2.0)
		await Wit_say("Today was just...", 3.0)
		told_where = true
		
	alldone()


func _on_interrogation_room_intro() -> void:
	Y_txt.text = ""
	Y_AD.hide()
	$You.show()
	$Main.hide()
	$Options.hide()
	
	$"You/pop up".play("pop")
	await $"You/pop up".animation_finished
	
	
	await say("Good evening.", 2.0)
	await say("I'm Detective Ward, but you can call me Theo.", 5.0)
	await say("I'm investigating your friend Megan's death, and I just need a few answers.", 5.0)
	await say("Take your time.", 4.0)
	
	
	await Wit_say("Ok.", 3.0)
	
	alldone()


func w2() -> void:
	
	Y_txt.text = ""
	Y_AD.hide()
	$You.show()
	$Main.hide()
	$Options.hide()
	$Connection.hide()
	
	await say("She was a nuisance? What'd she do?", 2.0)
	
	await Wit_say("She always loitered around store messing with customers,", 3)
	await Wit_say("She'd argue with my coworkers all the time, constant backtalking. She's such a mess-", 2)
	await Wit_say("Was I mean. Was.", 2)
	
	await Wit_say("Something must have gone wrong a few years ago to make her end up like... that.", 2)
	
	alldone()


func w1() -> void:
	Y_txt.text = ""
	Y_AD.hide()
	$You.show()
	$Main.hide()
	$Options.hide()
	$Connection.hide()
	
	$"You/pop up".play("pop")
	await $"You/pop up".animation_finished
	
	await say("What were you doing with Megan before 7:30?", 2.0)
	
	await Wit_say("Oh I work at Rublix Grocery, the building across from the gallery.", 3)
	
	await Wit_say("It's a busy store, and she used to just rile my coworkers up-", 0)
	await Wit_say("Woo~ don't know why I'm getting empathatic.", 2)
	await Wit_say("What a tragic loss.", 2)
	
	Y_txt.text = ""
	Y_AD.hide()
	$You.show()
	$Main.hide()
	$Options.hide()
	$Work.hide()
	await say("...", 2.0)
	
	alldone()


func naem() -> void:
	
	
	await Wit_say("Panya Gibson.", 3)
