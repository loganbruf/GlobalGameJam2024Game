extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	self.pressed.connect(self.quit_game)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func quit_game():
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()
