extends Node

@export var health: int = 3
var curr_health: int
var points: int = 0

var livingEnemies = 0;
var inFight = false;

var rng = RandomNumberGenerator.new();
var funnyLinks = [	"https://open.spotify.com/track/6Yd1iFUVD4z0zo2wZPZhJb?si=9a65d60d58684f4d", 
					"https://www.youtube.com/watch?v=dQw4w9WgXcQ", "https://www.linkedin.com", 
					"https://www.coolmathgames.com/0-papas-freezeria",
					"https://www.myinstants.com/media/sounds/buddy-holly-weezer-guitar-lick.mp3"];

func _ready():
	reset_health()

func _process(delta):
	if curr_health <= 0:
		var my_random_number = rng.randi_range(0, funnyLinks.size()-1);
		OS.shell_open(funnyLinks[my_random_number]);
		
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

func resetGame():
	reset_global_vars();
	livingEnemies = 0;
	inFight = false;
