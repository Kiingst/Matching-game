extends Node2D

var hovered = false
var flipped = false 
var clickable = true
var flip_animation
## get_animation("Flip_right")
signal flipped_signal

#values set by main 
var value
var picture
var front_picture
var test_string = "ion know"

var testing = "res://PixelCard_Assets/Cards/Card_Back_Blue_New.png"

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("cards")
	add_to_group(str(value))
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (hovered == true) or (flipped == true):
		$outline.visible = true
	else:
		$outline.visible = false


func _on_card_area_input_event(viewport, event, shape_idx):
	
	if Input.is_action_pressed("Left_Click") and (clickable == true):
		#start timer
		clickable = false
		flip_card()


func flip_card():
	$flip_timer.start()
	
	if flipped == false:
		flip_animation = $AnimationPlayer.libraries.get("").get_animation("Flip_right")
		flip_animation.track_set_key_value(0, 2, load(picture))
		$AnimationPlayer.play("Flip_right")
		print("card value is " , value)
		flipped = true
		emit_signal("flipped_signal" , self)
	else:
		$AnimationPlayer.play_backwards("Flip_back")
		flipped = false
		clickable = true
		pass

func _on_card_area_mouse_entered():
	hovered = true


func _on_card_area_mouse_exited():
	hovered = false

# timer to fix glitch where you click while the card is turning
func _on_flip_timer_timeout():
	#clickable = true
	pass

func not_clickable():
	clickable = false
	

func is_clickable():
	clickable = true
