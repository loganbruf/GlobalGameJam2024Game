extends Node

@export var health: int = 3
var curr_health: int
var points: int = 0

func get_health():
	return curr_health

func reset_health():
	curr_health = health
	
func game_over():
	if curr_health <= 0:
		reset_health()
		SceneVariables.goto_scene("res://Scenes/UIScenes/GameOver.tscn")

func take_damage(damage):
	curr_health -= damage
