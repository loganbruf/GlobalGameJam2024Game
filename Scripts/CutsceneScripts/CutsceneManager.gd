extends Node2D

@export var resource : DialogueResource
@export var dialogue_key : String
@export var next_scene: String
var is_dialogue_open : bool = false

func _ready():
	$EnterKey.hide()
	is_dialogue_open = false
		
func _process(delta):
	if Input.is_action_just_pressed("accept") && !is_dialogue_open:
		is_dialogue_open = true
		$AnyKey.hide()
		$EnterKey.show()
		open_dialogue()
	if Input.is_action_just_pressed("next"):
		if is_dialogue_open:
			SceneVariables.goto_scene(next_scene)
			is_dialogue_open = false
	
func open_dialogue():
	DialogueManager.show_example_dialogue_balloon(resource, dialogue_key)
