extends Node

func _ready():
	$Laugh.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Points.text = str(GlobalVariables.points)
	if GlobalVariables.points % 5 == 0:
		laugh()

func laugh():
	$Laugh.show()
	$Laugh.play()
