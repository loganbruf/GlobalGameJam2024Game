extends CharacterBody2D

@export var speed = 400
var rotation_direction = Vector2.ZERO

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed


func _physics_process(delta):
	get_input()
	move_and_slide()


	
