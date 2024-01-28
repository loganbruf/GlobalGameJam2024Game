extends Sprite2D

var	healthBarImgs = [
	null,
	load("res://Sprites/1hp.png"),
	load("res://Sprites/2hp.png"),
	load("res://Sprites/3hp.png")
]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var health = GlobalVariables.get_health()
	texture = healthBarImgs[health]
