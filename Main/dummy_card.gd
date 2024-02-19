extends Sprite2D

var card_back : String

# Called when the node enters the scene tree for the first time.
func _ready():
	self.texture = load(card_back)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_card_color():
	card_back = Global.set_card_color()
