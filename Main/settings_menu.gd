extends Control

signal settings_color_switch
signal back
var music

# Called when the node enters the scene tree for the first time.
func _ready():
	music = get_tree().get_nodes_in_group("music")[0].Backgound_music_name
	#$Label.text = music.stream.get_stream_name()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$MarginContainer/VBoxContainer/HBoxContainer2/VBoxContainer/music/Music_Label.text = music


func _on_blue_pressed():
	emit_signal("settings_color_switch" , "1")
	Global.card_color = 1
	$MarginContainer/VBoxContainer/HBoxContainer2/VBoxContainer/MarginContainer/Card_selected.text = "You Picked Blue"


func _on_dark_green_pressed():
	emit_signal("settings_color_switch" , "2")
	Global.card_color = 2
	$MarginContainer/VBoxContainer/HBoxContainer2/VBoxContainer/MarginContainer/Card_selected.text = "You Picked Dark Green"


func _on_light_green_pressed():
	emit_signal("settings_color_switch" , "3")
	Global.card_color = 3
	$MarginContainer/VBoxContainer/HBoxContainer2/VBoxContainer/MarginContainer/Card_selected.text = "You Picked Light Green"


func _on_pink_pressed():
	emit_signal("settings_color_switch" , "4")
	Global.card_color = 4
	$MarginContainer/VBoxContainer/HBoxContainer2/VBoxContainer/MarginContainer/Card_selected.text = "You Picked Pink"

func _on_red_pressed():
	emit_signal("settings_color_switch" , "5")
	Global.card_color = 5
	$MarginContainer/VBoxContainer/HBoxContainer2/VBoxContainer/MarginContainer/Card_selected.text = "You Picked Red"


func _on_yellow_pressed():
	emit_signal("settings_color_switch" , "6")
	Global.card_color = 6
	$MarginContainer/VBoxContainer/HBoxContainer2/VBoxContainer/MarginContainer/Card_selected.text = "You Picked Yellow"


func _on_back_button_pressed():
	emit_signal("back")


func _on_music_back_pressed():
	get_tree().get_nodes_in_group("music")[0].music_forward()
	music = get_tree().get_nodes_in_group("music")[0].Backgound_music_name


func _on_music_forward_pressed():
	get_tree().get_nodes_in_group("music")[0].music_back()
	music = get_tree().get_nodes_in_group("music")[0].Backgound_music_name
