extends Control
signal play_again


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	$MarginContainer/VBoxContainer/HBoxContainer2/VBoxContainer/Stats.text = """ Game Stats

	Cards Flipped: %d
	Combos: %d
	Pairs Failed: %d""" % [Stats.cards_flipped, Stats.combos, Stats.pairs_failed ] 


func _on_play_again_pressed():
	#self.visible = false
	#emit_signal("play_again")
	get_tree().reload_current_scene()
