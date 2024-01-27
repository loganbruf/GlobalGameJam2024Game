extends Area2D

@export var speed = 100;
@export var squareSize = 200;
@export var maxHealth = 3;
var health = maxHealth;

var screenSize;

@export var cooldownLength = 0.5;
var cooldownTimer = 0;

const root2 = 1.4142;
const root2Inverse = 0.70710;

# Called when the node enters the scene tree for the first time.
func _ready():
	screenSize = get_viewport_rect().size;
	print(screenSize);
	position.x = screenSize[0]*0.5;
	position.y = screenSize[1]*0.5;


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
	
	var velocity;
	
	if (movingDown != 0 && movingRight != 0):
		velocity = Vector2(movingRight*speed*root2Inverse, movingDown*speed*root2Inverse);
	else:
		velocity = Vector2(movingRight*speed, movingDown*speed);
	
	position += velocity * delta;
	
	position.x = clamp(position.x, 0.5*screenSize[0]-squareSize, 0.5*screenSize[0]+squareSize);
	position.y = clamp(position.y, 0.5*screenSize[1]-squareSize, 0.5*screenSize[1]+squareSize);
	
	cooldownTimer -= delta;
	cooldownTimer = max(cooldownTimer, 0);
	
	##Deal with taking damage from attacks.
	var highestAttackDamage = 0; 
	var tookDamage = false;
	#If there are multiple attacks hitting, use the one with highest damage
	#Depending how health ends up working, this may be even simpler than this
	
	if (cooldownTimer == 0):
		for collision in get_overlapping_areas():
			var damage = collision.damage;
			print(collision.name + ": " + str(damage) + " damage");
			
			highestAttackDamage = max(highestAttackDamage, damage);
			tookDamage = true;
		
		if (tookDamage):
			health -= highestAttackDamage;
			cooldownTimer = cooldownLength;
	


