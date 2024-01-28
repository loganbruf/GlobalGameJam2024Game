extends Bullet

var speed;
var direction;

func _ready():
	super._ready();
	damage = 0;
	enemyDamage = 1;
	damage = 0;
	speed  = 500;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func doMovementPhase(delta):
	position += delta * direction * speed;
	var bulletAngle = -atan2(direction[0], direction[1]);
	
	rotation = bulletAngle;

