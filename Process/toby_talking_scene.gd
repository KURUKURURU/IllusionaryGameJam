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
	
	op1_text.text = "How well do you know Megan Camargo?"
	op2_text.text = "Where were you at 7:30?"
	op3_text.text = ""
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
	
	$You/clickicon.show()
	$You/AnimationPlayer.play("fadein")
	
	
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
		await Wit_say("Oh I know her well. She frequents where I work.", 2.0)
		await Wit_say("I can't believe she's passed.", 2.0)
		await Wit_say("She was quite a nuisance, but it's obviously still tragic.", 2.0)
		
		knows_shes_dead = true
		
		$Work.show()
		await Wit_say("...Poor girl.", 100)
		
	elif knows_shes_dead:
		$Work.show()
		await Wit_say("She was a daily nuisance at my job but she was important to somebody I'm sure.", 100)
	
	alldone()

func where_greg() -> void:
	
	emit_signal("done_op")
	$Options.hide()
	
	if told_where: 
		await Wit_say("I was working right before that I think, and then left right around 7:30ish. Yes I did.", 2.0)
	if !told_where:
		await Wit_say("I had just ended my shift, because you know most buildings tonight close 7:15,", 2.0)
		await Wit_say("For some random holiday or soomething. Forgot.", 3.0)
		await Wit_say("And I made it home maybe 7:40, and then received your call.", 3.0)
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
	await say("I'm Detective Ward, and I'm investigating a crime that took place near 
	you tonight.", 5.0)
	await say("That's why you're here– you're going to give your statement.", 4.0)
	
	
	await Wit_say("Alright, though I can't say I'll be helpful.", 3.0)
	await Wit_say("That poor child.", 4.0) 
	await Wit_say(" Though I couldn't say she didn't have it coming.", 3.0)
	
	alldone()


func w2() -> void:
	
	Y_txt.text = ""
	Y_AD.hide()
	$You.show()
	$Main.hide()
	$Options.hide()
	$Work.hide()
	
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
	$Work.hide()
	
	$"You/pop up".play("pop")
	await $"You/pop up".animation_finished
	
	await say("Where do you work?", 2.0)
	
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
