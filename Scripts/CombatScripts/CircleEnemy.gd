extends GeneralEnemy

var radius = 100;
var center = Vector2(0, 0);
var angle = 0;
var angularSpeed = PI/2; #degrees per scond I think

# Called when the node enters the scene tree for the first time.
func _ready():
	health = 2;
	super._ready();

func doMovementPhase(delta):
	angle += angularSpeed * delta;
	position = Vector2(center[0] + radius * cos(angle), center[1] + radius * sin(angle));

func _on_viewport_size_changed():
	var generalCenterX = center[0] - 0.5 * screenSize[0];
	var generalCenterY = center[1] - 0.5 * screenSize[1];
	
	super._on_viewport_size_changed();
	
	center[0] = screenSize[0]*0.5 + generalCenterX;
	center[1] = screenSize[1]*0.5 + generalCenterY;
