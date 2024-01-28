extends Node2D

@export var resource : DialogueResource
@export var dialogue_key : String
@export var next_scene: String
var is_dialogue_open : bool = false


func _ready():
	$EnterKey.hide()

func _process(delta):
	if !is_dialogue_open && Input.is_action_just_pressed("next"):
		SceneVariables.goto_scene(next_scene)
	elif Input.is_action_just_pressed("next"):
		OS.shell_open("https://media1.tenor.com/m/qldk8W8R2WIAAAAd/jikowrld-druski.gif")

func _input(event):
	if event is InputEventKey && !is_dialogue_open:
		is_dialogue_open = true
		$AnyKey.hide()
		$EnterKey.show()
		open_dialogue()
	
func open_dialogue():
	DialogueManager.show_example_dialogue_balloon(resource, dialogue_key)
