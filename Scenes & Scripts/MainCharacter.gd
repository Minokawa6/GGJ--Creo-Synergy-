extends CharacterBody2D

const SPEED = 300.0

@onready var sprite = get_node("AnimatedSprite")

var openBook = false

signal observe(activate)
signal collided_object(collision)

func _process(delta):
	if Input.is_action_pressed("Up"):
		sprite.play("Up")
	elif Input.is_action_pressed("Down"):
		sprite.play("Down")
	elif Input.is_action_pressed("Left"):
		sprite.play("Left")
	elif Input.is_action_pressed("Right"):
		sprite.play("Right")
	else:
		sprite.stop()

func _physics_process(delta):
	# Used to process player movement
	var direction = Vector2()
	
	if !openBook:
		# Player can only move if the book is not opened
		direction.x = Input.get_axis("Left", "Right")
		direction.y = Input.get_axis("Up","Down")
	
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
	collided_object.emit(area)
	print("Flower")

func _on_area_2d_area_exited(area):
	#emits if Player leaves the observable flower
	observe.emit(false)
	print("Left Flower")

func _on_gui_open_book(opened):
	#detects if the book is opened or not
	openBook = opened

