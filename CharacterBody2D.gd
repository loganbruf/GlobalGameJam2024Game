extends CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	DialogueManager.show_example_dialogue_balloon(load("res://dialogue/game_start.dialogue"), "start")