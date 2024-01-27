extends Area2D

@export var damage = 1;
var screenSize;

# Called when the node enters the scene tree for the first time.
func _ready():
	screenSize = get_viewport_rect().size;
	get_tree().root.connect("size_changed", _on_viewport_size_changed);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_viewport_size_changed():
	var generalPosX = position.x - 0.5 * screenSize[0];
	var generalPosY = position.y - 0.5 * screenSize[1];
	
	screenSize = get_viewport_rect().size;
	position.x = screenSize[0]*0.5 + generalPosX;
	position.y = screenSize[1]*0.5 + generalPosY;
