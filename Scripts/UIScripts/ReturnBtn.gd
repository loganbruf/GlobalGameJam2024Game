extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	self.pressed.connect(self.return_to_main)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func return_to_main():
	GlobalVariables.resetGame();
	SceneVariables.goto_scene("res://Scenes/UIScenes/MainMenu.tscn")
