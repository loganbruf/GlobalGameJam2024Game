extends Area2D

var health = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	bulletCheck();

func bulletCheck():
	for collision in get_overlapping_areas():
		if ("enemyDamage" in collision):
			health -= collision.enemyDamage;
			collision.call_deferred("free");
			if (health <= 0):
				call_deferred("free");
