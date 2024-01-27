extends Area2D

var screenSize;

# Called when the node enters the scene tree for the first time.
func _ready():
	screenSize = get_viewport_rect().size;
	print(screenSize);
	position.x = screenSize[0]*0.5 - 200;
	position.y = screenSize[1]*0.5 - 200;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
