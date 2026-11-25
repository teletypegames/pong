# A racket, moved up and down by the actions named in its UP_KEY and DOWN_KEY metadata.
extends RigidBody2D


# Speed in pixels per second.
const SPEED = 800.0

# Moves the racket while its keys are held.
func _physics_process(delta):
	if Input.is_action_pressed(get_meta("UP_KEY")):
		move_and_collide(Vector2.UP * SPEED * delta)
	
	if Input.is_action_pressed(get_meta("DOWN_KEY")):
		move_and_collide(Vector2.DOWN * SPEED * delta)
