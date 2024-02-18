extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_card_face(number):
	match number:
		1:
			return "res://PixelCard_Assets/Cards/Clubs/Card_2Clubs.png"
		2:
			return "res://PixelCard_Assets/Cards/Clubs/Card_3Clubs.png"
		3:
			return "res://PixelCard_Assets/Cards/Clubs/Card_4Clubs.png"
		4:
			return "res://PixelCard_Assets/Cards/Clubs/Card_5Clubs.png"
		5:
			return "res://PixelCard_Assets/Cards/Clubs/Card_6Clubs.png"
		6:
			return "res://PixelCard_Assets/Cards/Clubs/Card_7Clubs.png"
		7:
			return "res://PixelCard_Assets/Cards/Clubs/Card_8Clubs.png"
		8:
			return "res://PixelCard_Assets/Cards/Clubs/Card_9Clubs.png"
		9:
			return "res://PixelCard_Assets/Cards/Clubs/Card_10Clubs.png"
		10:
			return "res://PixelCard_Assets/Cards/Clubs/Card_AceClubs_Big.png"
		11:
			return "res://PixelCard_Assets/Cards/Clubs/Card_Jack.png"
		12:
			return "res://PixelCard_Assets/Cards/Clubs/Card_King.png"
		13:
			return "res://PixelCard_Assets/Cards/Clubs/Card_Queen.png"
		14:
			return "res://PixelCard_Assets/Cards/Diamonds/Card_2Diamonds.png"
		15:
			return "res://PixelCard_Assets/Cards/Diamonds/Card_3Diamonds.png"
		16:
			return "res://PixelCard_Assets/Cards/Diamonds/Card_4Diamonds.png"
		17:
			return "res://PixelCard_Assets/Cards/Diamonds/Card_5Diamonds.png"
		18:
			return "res://PixelCard_Assets/Cards/Diamonds/Card_6Diamonds.png"
		19:
			return "res://PixelCard_Assets/Cards/Diamonds/Card_7Diamonds.png"
		20:
			return "res://PixelCard_Assets/Cards/Diamonds/Card_8Diamonds.png"
		21:
			return "res://PixelCard_Assets/Cards/Diamonds/Card_9Diamonds.png"
		22:
			return "res://PixelCard_Assets/Cards/Diamonds/Card_10Diamonds.png"
		23:
			return "res://PixelCard_Assets/Cards/Diamonds/Card_ClubOfDiamond_Big.png"
		24:
			return "res://PixelCard_Assets/Cards/Diamonds/Card_JackDiamond.png"
		25:
			return "res://PixelCard_Assets/Cards/Diamonds/Card_KingDiamond.png"
		26:
			return "res://PixelCard_Assets/Cards/Diamonds/Card_QueenDiamond.png"
		27:
			return "res://PixelCard_Assets/Cards/Hearts/Card_2Hearts_Black.png"
		28:
			return "res://PixelCard_Assets/Cards/Hearts/Card_3Hearts.png"
		29:
			return "res://PixelCard_Assets/Cards/Hearts/Card_4Hearts.png"
		30:
			return "res://PixelCard_Assets/Cards/Hearts/Card_5Hearts.png"
		31:
			return "res://PixelCard_Assets/Cards/Hearts/Card_6Hearts.png"
		32:
			return "res://PixelCard_Assets/Cards/Hearts/Card_7Hearts.png"
		33:
			return "res://PixelCard_Assets/Cards/Hearts/Card_8Hearts.png"
		34:
			return "res://PixelCard_Assets/Cards/Hearts/Card_9Hearts.png"
		35:
			return "res://PixelCard_Assets/Cards/Hearts/Card_10Hearts.png"
		36:
			return "res://PixelCard_Assets/Cards/Hearts/Card_AceHearts_Big.png"
		37:
			return "res://PixelCard_Assets/Cards/Hearts/Card_JackHearts.png"
		38:
			return "res://PixelCard_Assets/Cards/Hearts/Card_KingHeart.png"
		39:
			return "res://PixelCard_Assets/Cards/Hearts/Card_QueenHeart.png"
		40:
			return "res://PixelCard_Assets/Cards/Spades/Card_2Spades.png"
		41:
			return "res://PixelCard_Assets/Cards/Spades/Card_3Spades.png"
		42:
			return "res://PixelCard_Assets/Cards/Spades/Card_4Spades.png"
		43:
			return "res://PixelCard_Assets/Cards/Spades/Card_5Spades.png"
		44:
			return "res://PixelCard_Assets/Cards/Spades/Card_6Spades.png"
		45:
			return "res://PixelCard_Assets/Cards/Spades/Card_7Spades.png"
		46:
			return "res://PixelCard_Assets/Cards/Spades/Card_8Spades.png"
		47:
			return "res://PixelCard_Assets/Cards/Spades/Card_9Spades.png"
		48:
			return "res://PixelCard_Assets/Cards/Spades/Card_10Spades.png"
		49:
			return "res://PixelCard_Assets/Cards/Spades/Card_AceSpade_Big.png"
		50:
			return "res://PixelCard_Assets/Cards/Spades/Card_JackSpade.png"
		51:
			return "res://PixelCard_Assets/Cards/Spades/Card_KingSpade.png"
		52:
			return "res://PixelCard_Assets/Cards/Spades/Card_QueenSpade.png"
		_:
			return "not a valid number"
