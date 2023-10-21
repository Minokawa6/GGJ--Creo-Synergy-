extends CharacterBody2D

const SPEED = 300.0
@onready var sprite = get_node("AnimatedSprite2D")

func _physics_process(delta):
	var direction = Vector2()
	var collision
	
	direction.x = Input.get_axis("Right", "Left")
	direction.y = Input.get_axis("Up","Down")
	
	if direction.y < 0:
		sprite.frame = 2
	elif direction.y > 0: 
		sprite.frame = 0
	elif direction.x > 0:
		sprite.frame = 1
	elif direction.x < 0:
		sprite.frame = 1
	
	if direction:
		velocity = direction.normalized() * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.x, 0, SPEED)
		velocity.normalized()
	
	move_and_slide()

func _on_area_2d_area_entered(area):
	print("Flower")

func _on_flower_body_exited(body):
	print("Left Flower")
