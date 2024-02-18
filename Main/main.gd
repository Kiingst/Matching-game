extends Node2D

@export var sizex : int
@export var sizey : int 
@export var card : PackedScene 

var margin = 4
var num_cards

var card_maker_counter = 0

var xcounter : float = 1.0
var ycounter : float = 1.0

var maxx : float = 700
var maxy = 416

var card1 


var points = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	num_cards = sizex * sizey
	var x = generate_unique_random_numbers(num_cards / 2)
	print(x)
	generate_cards(num_cards / 2 , x)
	
	shuffle_cards()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Control/Label.text = str(points)


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
		print(card1.value)
		print(card.value)
		if card1.value == card.value:
			points += 1
			
			card1.queue_free()
			card.queue_free()
			card1 = null
		else:
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




