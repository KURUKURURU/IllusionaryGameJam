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
	
	op1_text.text = "Explain what you were doing before you found her." #mention schedule and newspaper
	op2_text.text = "Have you seen her around the park before?" #mention picking trash
	#op3_text.hide
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
	
	#if !knows_shes_dead:
		#await Wit_say("We were like sisters.", 3.0)
		#await Wit_say("I can't believe she's dead. We were just together two hours ago...", 4.0)
		#await Wit_say("...and now she's gone.", 4.0)
		#
		#$Connection.show()
		#await Wit_say("Whoever did this...", 100)
		#
	#elif knows_shes_dead:
		#$Work.show()
		#await Wit_say("We were just shopping hours ago.", 2.0)
		#await Wit_say("...", 0)
		#
		#$Connection.show()
		#await Wit_say("I think I'm going to throw up.", 100)
	
	await Wit_say("Well,", 0)
	await Wit_say("Maybe around 4 or 5 I was walking around town,", 2)
	await Wit_say("to get my blood pumping, keep me young,", 3)
	await Wit_say("And around 6 I picked up a newspaper, read it a bit, and walked back to the park.", 4)
	
	Y_txt.text = ""
	Y_AD.hide()
	$You.show()
	$Main.hide()
	$Options.hide()
	$Connection.hide()
	
	await say("You sleep in the park?", 2.0)
	
	await Wit_say("The park is basically my house.", 4)
	await Wit_say("People call me 'Green' all the time because of it.", 4)
	await Wit_say("Well, I feel it's more because I pick up trash around there.", 5)
	await Wit_say("Anyways, I arrived back at the park around 7ish I think.", 4)
	await Wit_say("Laid on my bench at the southeastern part of the park,", 3)
	await Wit_say("and after a few I heard some commotion.", 3)
	await Wit_say("Got up and headed straight towards the source obviously.", 3)
	await Wit_say("...", 0)
	await Wit_say("The kid was dead.", 5)
	
	
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
	await say("I'm Detective Ward, and I can see from the report you're Herald Roman.", 5.0)
	await say("I understand you found the body, and I just need you to answer a few things.", 3.0)
	await say("Tell me if you need anything.", 4.0)
	
	await Wit_say("Yes sir.", 3.0)
	
	alldone()


func naem() -> void:
	
	
	await Wit_say("Green. People call me Green.", 3)
	await Wit_say("It's because I pick up trash in the park.", 3)
	await Wit_say("I don't mind the nickname.", 3)
	
	alldone()


func green_seen() -> void:
	$Connection.hide()
	
	await Wit_say("I have seen her before,", 2)
	await Wit_say("A few times before in the park, in fact.", 2)
	await Wit_say("It's usually earlier, before I get to bed.", 2)
	await Wit_say("I also know her as the local trouble maker,", 2)
	await Wit_say("Constantly getting into fights and shoplifting. A bad kid, ya know?", 2)
	
	$Why.show()
	await Wit_say("I'm surprised she lived that long with that kind of attitude.", 100)
	
	
	
	alldone()


func whysay() -> void:
	await Wit_say("I've spent a good while in prison.", 4)
	await Wit_say("You know that too, after all you're a cop. Cops know everything.", 6)
	await Wit_say("Though I doubt her life was that extreme,", 2)
	await Wit_say("You get to know what kind of people last in worlds of crime.", 2)
	await Wit_say("Especially when you've dealt with youths dying daily for doing less ballsy things that her in prison.", 2)


func seen() -> void:
	pass # Replace with function body.
