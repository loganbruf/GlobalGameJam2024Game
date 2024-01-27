extends GeneralEnemy

var speed = 80;

@export var squareSize = 200;

var zigzagCenter = 0;
var zigzagWidth = 80;

var minY;
var maxY;

var xDirection = 0;
var yDirection = 0;

func _ready():
	super._ready();
	minY = 0.6*screenSize[1]-squareSize;
	maxY = 0.6*screenSize[1]+squareSize;
	print("min y: " + str(minY));
	print("max y: " + str(maxY));

func doMovementPhase(delta):
	if (position[0] < zigzagCenter - 0.5*zigzagWidth):
		xDirection = 1;
	elif (position[0] > zigzagCenter + 0.5*zigzagWidth):
		xDirection = 0;
	
	if (xDirection == 1):
		position.x += 1;
	else:
		position.x -= 1;
		
	if (position[1] < minY):
		yDirection = 1;
	elif (position[1] > maxY):
		yDirection = 0;
	
	if (yDirection == 1):
		position.y += 1;
	else:
		position.y -= 1;

func _on_viewport_size_changed():
	var generalXCenter = zigzagCenter - 0.5 * screenSize[0];
	super._on_viewport_size_changed();
	zigzagCenter = screenSize[0]*0.5 + generalXCenter;
	minY = 0.6*screenSize[1]-squareSize;
	maxY = 0.6*screenSize[1]+squareSize;
