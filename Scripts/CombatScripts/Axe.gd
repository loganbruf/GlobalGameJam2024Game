extends Bullet

@export var bulletGravity = 80;
@export var velocity = Vector2(0, 0);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func doMovementPhase(delta):
	velocity[1] += bulletGravity * delta;
	position += velocity * delta;
