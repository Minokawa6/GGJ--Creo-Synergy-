extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	var direction = Vector2()
	var collision
	
	direction.x = Input.get_axis("Right", "Left")
	direction.y = Input.get_axis("Up","Down")
	
	if direction:
		velocity = direction.normalized() * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.x, 0, SPEED)
		velocity.normalized()
	
	move_and_slide()
	#collision = 
	#if collision:
	#	velocity = velocity.slide(collision.get_normal())
	
