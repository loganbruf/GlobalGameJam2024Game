extends Sprite2D


var health = 3
var	healthBarImgs = [
	null,
	load("res://Sprites/1hp.png"),
	load("res://Sprites/2hp.png"),
	load("res://Sprites/3hp.png")
]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func on_take_damage():
	health -= 1
	texture = healthBarImgs[health]
	if health == 0:
		SceneVariables.goto_scene("res://Scenes/UIScenes/GameOver.tscn")
