extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	self.pressed.connect(self.start_game_scene)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func start_game_scene():
	GlobalVariables.reset_health()
	SceneVariables.goto_scene("res://Scenes/Cutscenes/cutscene1.tscn");

