extends Node

var audioPlaying: bool = false

func _ready():
	$Laugh.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GlobalVariables.points % 2 == 0 && GlobalVariables.points != 0:
		laugh()
	else:
		$Laugh.hide()
		audioPlaying = false

func laugh():
	if !audioPlaying:
		$Haha.play()
		audioPlaying = true
	$Laugh.show()
	$Laugh.play()
