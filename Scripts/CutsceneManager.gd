extends Node2D

@export var resource : DialogueResource
@export var dialogue_key : String
@export var next_scene: String
var is_dialogue_open : bool = false

func _process(delta):
	if Input.is_action_just_pressed("next"):
		SceneVariables.goto_scene(next_scene)

func _input(event):
	if event is InputEventKey && !is_dialogue_open:
		is_dialogue_open = true
		open_dialogue()
	
func open_dialogue():
	DialogueManager.show_example_dialogue_balloon(resource, dialogue_key)
