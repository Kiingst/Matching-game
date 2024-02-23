extends Sprite2D

var card_back : String
var pos_to_move_to 
var moving: bool = false
var original_pos
@export var speed : int

signal card_to_point
# Called when the node enters the scene tree for the first time.
func _ready():
	set_card_color()
	self.texture = load(card_back)
	add_to_group("dummy_cards")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if moving == true:
		if global_position.distance_to(pos_to_move_to) < 2 :
			#queue_free()
			moving = false
			
		#start to move
		var direction = (pos_to_move_to - global_position).normalized()
		global_position += direction * speed * delta

func set_card_color():
	card_back = Global.set_card_color()


func move_back():
	pos_to_move_to = original_pos
	moving = true
	self.visible = true

func move_to_middle():
	pos_to_move_to = get_tree().get_nodes_in_group("middle_marker")[0].global_position
	moving = true
	self.visible = false
	
