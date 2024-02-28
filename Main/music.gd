extends Node
var music_num = 1
var Backgound_music_name : String



# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("music")
	reload_Music()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func reload_Music():
	$Back_ground_music.stream = load(get_song_from_music_num()[0])
	$Back_ground_music.play()
	Backgound_music_name = get_song_from_music_num()[1]

func get_song_from_music_num():
	match music_num :
		1:
			return ["res://Chill Jazz Music Pack Easy Loop .WAV/Chill Out, Man.wav", "Chill Out, Man"]
		2:
			return ["res://Chill Jazz Music Pack Easy Loop .WAV/Brass Tacks.wav", "Brass Tacks"]
		3:
			return ["res://Chill Jazz Music Pack Easy Loop .WAV/Challenge in Progress.wav", "Challenge in Progress"]
		4:
			return ["res://Chill Jazz Music Pack Easy Loop .WAV/Activity in Progress.wav", "Activity in Progress"]
		5:
			return ["res://Chill Jazz Music Pack Easy Loop .WAV/At the Pad.wav", "At the Pad"]
		6:
			return ["res://Chill Jazz Music Pack Easy Loop .WAV/New Tech.wav", "New Tech"]
			
	

func music_forward():
	if music_num < 6:
		music_num += 1
	else:
		music_num = 1
	
	reload_Music()

func music_back():
	if music_num > 1:
		music_num -= 1
	else:
		music_num = 6
	
	reload_Music()
