extends Node2D

@export var sizex : int
@export var sizey : int 
@export var card : PackedScene 
@export var dummy_card : PackedScene

var margin = 4
var num_cards : int

var card_maker_counter : int = 0

var xcounter : float = 1.0
var ycounter : float = 1.0

var maxx : float = 700
var maxy = 416

var card1 
var points = 0

var cards

# Called when the node enters the scene tree for the first time.
func _ready():
	num_cards = sizex * sizey
	
	
	#play shuffle animation
		#place dummy cards 
		#have dummy cards position 
		#have the animation go to the positon of the card and make that on card visible 
	
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Control/HBoxContainer/Label.text = str(points)
	if points == num_cards / 2:
		print("you win")


func generate_unique_random_numbers(amount):
	var numbers = []
	
	# create a list of 52 numbers
	for i in range(1, 53):
		numbers.append(i)
	
	var random_numbers = []
	
	# Randomly selec
	for k in range(amount):
		var index = randi() % numbers.size()
		var selected_number = numbers[index]
		random_numbers.append(selected_number)
		numbers.remove_at(index)
	
	return random_numbers

func generate_cards(amount, value):
	var xcoutner = 0
	var ycounter = 0
	
	for i in amount:
		var c = card.instantiate()
		var c2 = card.instantiate()
		c.picture = Global.get_card_face(value[i])
		c.value = value[i]
		c.connect("flipped_signal",Callable(self,"on_card_flipped"))
		
		c.position = get_next_card_pos()
		c2.position = get_next_card_pos()
		
		c2.connect("flipped_signal",Callable(self,"on_card_flipped"))
		c2.picture = Global.get_card_face(value[i])
		c2.value = value[i]
		$Cards.add_child(c)
		$Cards.add_child(c2)


func get_next_card_pos():
	#var temp = Vector2($Marker2D.position.x + ($Marker2D.position.x * xcounter) , $Marker2D.position.y + (104 * ycounter))
	var x : float = (maxx * (xcounter / sizex )) - 48
	var y : float = (maxy * (ycounter / sizey )) - 20
	var temp = Vector2( x , y)
	
	
	if xcounter >= sizex  :
		ycounter += 1
		xcounter = 1
	else:
			xcounter += 1
	
	return temp

func on_card_flipped(card):
	if card1 == null:
		card1 = card
	else:
		if card1.value == card.value:
			print("cards match")
			points += 1
			
			get_tree().call_group("cards", "not_clickable")
			await get_tree().create_timer(0.75).timeout
			$Music/Match_found.play()
			$Music/Match_found.pitch_scale += 0.05
			card1.queue_free()
			card.queue_free()
			get_tree().call_group("cards", "is_clickable")
			card1 = null
		else:
			print("cards no match")
			get_tree().call_group("cards", "not_clickable")
			await get_tree().create_timer(0.5).timeout
			card1.flip_card()
			card.flip_card()
			get_tree().call_group("cards", "is_clickable")
			card1 = null



func shuffle_cards():
	var cards_temp = $Cards.get_children()
	
	
	for i in range(cards_temp.size()):
		var random_index = randi() % cards_temp.size()
		var temp_position = cards_temp[i].position
		cards_temp[i].position = cards_temp[random_index].position
		cards_temp[random_index].position = temp_position
		#cards_temp[i].position = cards_shuffled[i].position
		#cards_shuffled[i].position = cards_temp[i].position


func place_dummy_cards():
	
	for i in $Cards.get_children().size() :
		var c = dummy_card.instantiate()
		
		c.position = $Shuffle/markers/Middle_marker.position
		c.original_pos = $Cards.get_children()[i].position
		c.connect("card_to_point",Callable(self,"make_shuffle_visible"))
		c.visible = false
		$Dummy_Card.add_child(c)



func play_start_animation():
	
	get_tree().call_group("cards", "not_clickable")
	get_tree().call_group("cards", "not_visible")
	cards = $Cards.get_children()
	
	place_dummy_cards()
	#await get_tree().create_timer(1.0).timeout
	#await get_tree().create_timer(2.5).timeout
	var shuffle_ani = $AnimationPlayer.libraries.get("").get_animation("Shuffle_cards")
	var x = shuffle_ani.track_get_key_value(0,0)
	var y = x.get("args")
	y[0] = str(Global.card_color)
	x["args"] = y
	shuffle_ani.track_set_key_value(0,0 , x)
	shuffle_ani.track_set_key_value(1,0 , x)
	
	
	
	
	$AnimationPlayer.play("Shuffle_cards")
	$Shuffle/Shuffle_sound.play()
	
	await get_tree().create_timer(1.5).timeout
	get_tree().call_group("dummy_cards", "move_to_middle")
	await get_tree().create_timer(3.0).timeout
	$Main_menu.visible = false
	get_tree().call_group("dummy_cards", "move_back")
	await get_tree().create_timer(2.5).timeout
	get_tree().call_group("dummy_cards", "queue_free")
	
	
	#play start sound
	
	get_tree().call_group("cards", "is_clickable")
	get_tree().call_group("cards", "make_visible")

func make_shuffle_visible():
	$Shuffle/Left_deck.visible = true
	$Shuffle/Right_deck.visible = true


func _on_start_pressed():
	$Main_menu/MarginContainer/VBoxContainer/HBoxContainer2/VBoxContainer/Start.visible = false
	$Main_menu/MarginContainer/VBoxContainer/HBoxContainer2/VBoxContainer/Settings.visible = false
	var x = generate_unique_random_numbers(num_cards / 2)
	print(x)
	generate_cards(num_cards / 2 , x)
	shuffle_cards()
	
	play_start_animation()


func _on_settings_pressed():
	open_setting_menu()


func open_main_menu():
	$Settings_Menu.visible = false
	$Main_menu.visible = true

func open_setting_menu():
	$Main_menu.visible = false
	$Settings_Menu.visible = true



func _on_settings_menu_back():
	open_main_menu()
