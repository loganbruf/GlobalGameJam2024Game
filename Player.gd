extends Area2D

@export var speed = 100;
@export var squareSize = 200;

var screenSize;
# Called when the node enters the scene tree for the first time.
func _ready():
	screenSize = get_viewport_rect().size;
	print(screenSize);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	##I'm saying for now that moving at an angle can just be faster than moving straight and that's fine
	var movingDown = 0;
	if (Input.is_action_pressed("move up")):
		movingDown -= 1;
	
	if (Input.is_action_pressed("move down")):
		movingDown += 1;
		
	var movingRight = 0;
	if (Input.is_action_pressed("move right")):
		movingRight += 1;
	
	if (Input.is_action_pressed("move left")):
		movingRight -= 1;
	
	var velocity = Vector2(movingRight*speed, movingDown*speed);
	
	position += velocity * delta;
	
	position.x = clamp(position.x, 0.5*screenSize[0]-squareSize, 0.5*screenSize[0]+squareSize);
	position.y = clamp(position.y, 0.5*screenSize[1]-squareSize, 0.5*screenSize[1]+squareSize);
