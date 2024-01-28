extends Node

@export var nextScene = "res://Scenes/UIScenes/MainMenu.tscn"; #provide full path

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (!GlobalVariables.inFight):
		SceneVariables.goto_scene(nextScene);
