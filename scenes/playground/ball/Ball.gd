# The ball: served from the middle in a random diagonal direction, and off
# in a new random one from every racket it hits.
extends RigidBody2D


# Speed in pixels per second.
const SPEED = 500.00


# Returns a velocity in one of the four diagonal directions at SPEED.
func get_random_linear_velocity():
	randomize()
	
	var x_direction = pow(-1, randi() % 2)
	var y_direction = pow(-1, randi() % 2)
	
	return Vector2(x_direction, y_direction) * SPEED

# Waits a second in the middle of the field, then serves.
func _ready():
	global_position = Vector2(640, 360)
	await get_tree().create_timer(1.0).timeout
	linear_velocity = get_random_linear_velocity()

func _process(delta):
	pass


# Bounces off in a new random direction.
func _on_body_entered(body):
	linear_velocity = get_random_linear_velocity()
