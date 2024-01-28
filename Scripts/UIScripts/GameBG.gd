extends Sprite2D


var initialScale = Vector2(scale.x, scale.y)
var initialScreenSize;


# Called when the node enters the scene tree for the first time.
func _ready():
	initialScreenSize = get_viewport_rect().size
	get_tree().root.connect("size_changed", _on_viewport_size_changed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_viewport_size_changed():
	var screenSize = get_viewport_rect().size;
	scale.x = initialScale.x * (screenSize.x / initialScreenSize.x)
	scale.y = initialScale.y * (screenSize.y / initialScreenSize.y)
	
	position.x = screenSize.x / 2
	position.y = screenSize.y / 2
