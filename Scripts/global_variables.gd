extends Node

@export var health: int = 3
var curr_health: int
var points: int = 0

var livingEnemies = 0;
var inFight = false;
func _ready():
	reset_health()

func _process(delta):
	if curr_health <= 0:
		reset_global_vars()
		SceneVariables.goto_scene("res://Scenes/UIScenes/GameOver.tscn")

func get_health():
	return curr_health

func reset_health():
	curr_health = health

func take_damage(dmg):
	curr_health -= dmg
	
func add_points(pts):
	points += pts

func reset_points():
	points = 0
	
func reset_global_vars():
	reset_points()
	reset_health()
	
func kill_enemy():
	livingEnemies-=1;
	if (livingEnemies == 0):
		inFight = false;
	
	print(str(livingEnemies) + " " + str(inFight));

func addEnemy():
	livingEnemies+=1;
	print(livingEnemies);
	inFight = true;
