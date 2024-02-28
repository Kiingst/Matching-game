extends Node

var is_combo_true = false

var cards_flipped = 0
var pairs_failed = 0
var combos = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	


func stats_card_flipped(bool1):
	if bool1 ==  null:
		cards_flipped += 1
		
	elif bool1 == true :
		
		cards_flipped += 1
		if is_combo_true == false:
			is_combo_true = true
		else:
			combos += 1
		
	else:
		pairs_failed += 1
		is_combo_true = false
		cards_flipped += 1
		pairs_failed = 0
