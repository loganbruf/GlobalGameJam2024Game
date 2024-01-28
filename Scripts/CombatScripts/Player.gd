extends Area2D

@export var speed = 200;
@export var squareSize = 200;

@export var playerWidth = 20;
var playerHalfWidth = playerWidth* 0.5;

var screenSize;

@export var cooldownLength = 0.5;
var cooldownTimer = 0;

@export var shotCooldownLength = 0.5;
var shotCooldownTimer = 0;
var fireDirection = Vector2(0, 1);
var bulletPrefab = preload("res://Scenes/CombatScenes/PlayerBullet.tscn");

const root2 = 1.4142;
const root2Inverse = 0.70710;

@onready var pew_sound = $pew_sound;

# Called when the node enters the scene tree for the first time.
func _ready():
	screenSize = get_viewport_rect().size;
	position.x = screenSize[0]*0.5;
	position.y = screenSize[1]*0.5;
	get_tree().root.connect("size_changed", _on_viewport_size_changed);
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	doMovementPhase(delta);
	doCollisionPhase(delta);
	tryFire(delta);
	look_at(get_global_mouse_position());
	rotate(PI/2);

func doMovementPhase(delta):
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
		fireDirection =  Vector2(movingRight*root2Inverse, movingDown*root2Inverse);
		velocity = fireDirection * speed;
	else:
		velocity = Vector2(movingRight*speed, movingDown*speed);
		if (velocity.x != 0 || velocity.y != 0):
			fireDirection = velocity / speed;
	
	position += velocity * delta;
	
	#this is how we're doing a game box border for the moment 
	position.x = clamp(position.x, 0.5*screenSize[0]+playerHalfWidth-squareSize, 
			0.5*screenSize[0]-playerHalfWidth+squareSize);
	position.y = clamp(position.y, 0.6*screenSize[1]+playerHalfWidth-squareSize, 
			0.6*screenSize[1]-playerHalfWidth+squareSize);
			
	if (movingRight != 0 || movingDown != 0):
		rotation = atan2(movingRight, -movingDown);

func doCollisionPhase(delta):
	cooldownTimer -= delta;
	cooldownTimer = max(cooldownTimer, 0);
	
	##Deal with taking damage from attacks.
	var highestAttackDamage = 0; 
	var tookDamage = false;
	
	#If there are multiple attacks hitting, use the one with highest damage
	#Depending how health ends up working, this may be even simpler than this
	if (cooldownTimer == 0):
		for collision in get_overlapping_areas():
			if !("damage" in collision):
				continue;
			
			var damage = collision.damage;
			print(collision.name + ": " + str(damage) + " damage");
			
			highestAttackDamage = max(highestAttackDamage, damage);
			tookDamage = true;
		
		if (tookDamage):
			GlobalVariables.take_damage(highestAttackDamage)
			cooldownTimer = cooldownLength;
			print("took " + str(highestAttackDamage) + " damage");

func tryFire(delta):
	shotCooldownTimer -= delta;
	shotCooldownTimer = max(shotCooldownTimer, 0);
	
	if (shotCooldownTimer != 0):
		return;
	
	if (Input.is_action_pressed("fire")):
		var bulletInstance = bulletPrefab.instantiate();
		bulletInstance.direction = (get_global_mouse_position() - position).normalized();
		bulletInstance.position = position;
		shotCooldownTimer = shotCooldownLength;
		print(bulletInstance.position);
		print(bulletInstance.direction);
		get_parent().add_child(bulletInstance);
		
		#pew sound when firing
		pew_sound.play()
		

func _on_viewport_size_changed():
	var generalPosX = position.x - 0.5 * screenSize[0];
	var generalPosY = position.y - 0.6 * screenSize[1];
	
	screenSize = get_viewport_rect().size;
	position.x = screenSize[0]*0.5 + generalPosX;
	position.y = screenSize[1]*0.6 + generalPosY;

