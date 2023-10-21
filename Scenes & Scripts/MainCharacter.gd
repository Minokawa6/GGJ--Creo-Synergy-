extends CharacterBody2D

const SPEED = 300.0

@onready var sprite = get_node("AnimatedSprite2D")

var openBook = false

signal observe(activate)

func _physics_process(delta):
	# Used to process player movement
	var direction = Vector2()
	var collision
	
	if !openBook:
		# Player can only move if the book is not opened
		direction.x = Input.get_axis("Right", "Left")
		direction.y = Input.get_axis("Up","Down")
	
	if direction.y < 0:
		sprite.frame = 1
	elif direction.y > 0: 
		sprite.frame = 0
	elif direction.x > 0:
		sprite.frame = 3
	elif direction.x < 0:
		sprite.frame = 2
	
	if direction:
		velocity = direction.normalized() * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.x, 0, SPEED)
		velocity.normalized()
	
	move_and_slide()

func _on_area_2d_area_entered(area):
	#emits if Player is in an observable flower
	observe.emit(true)
	print("Flower")

func _on_flower_body_exited(body):
	#emits if Player leaves the observable flower
	observe.emit(false)
	print("Left Flower")

func _on_gui_open_book(opened):
	#detects if the book is opened or not
	openBook = opened
