extends Area2D
class_name GeneralEnemy

var health = 0;
var screenSize;

# Called when the node enters the scene tree for the first time.
func _ready():
	screenSize = get_viewport_rect().size;
	get_tree().root.connect("size_changed", _on_viewport_size_changed);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	doBulletCheck();
	doMovementPhase(delta);

func doBulletCheck():
	for collision in get_overlapping_areas():
		if ("enemyDamage" in collision):
			health -= collision.enemyDamage;
			collision.call_deferred("free");
			if (health <= 0):
				call_deferred("free");

func doMovementPhase(_delta):
	pass;

func _on_viewport_size_changed():
	var generalPosX = position.x - 0.5 * screenSize[0];
	var generalPosY = position.y - 0.5 * screenSize[1];
	
	screenSize = get_viewport_rect().size;
	print(screenSize);
	position.x = screenSize[0]*0.5 + generalPosX;
	position.y = screenSize[1]*0.5 + generalPosY;
