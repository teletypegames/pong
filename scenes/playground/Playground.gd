# The playground: two rackets, the ball and the score.
# A ball that reaches a goal area scores for the other side and a new one is served.
extends Node2D

# The ball scene, instanced for every round.
var Ball = preload("res://scenes/playground/ball/Ball.tscn")

# The left player's score.
var left_point = 0
# The right player's score.
var right_point = 0

# Serves a new ball.
func start():
	var ball = Ball.instantiate()
	add_child(ball)

# Shows the score as "left - right".
func set_score():
	get_node("Score").text = "{left} - {right}".format({
		"left": left_point,
		"right": right_point
	})


# Takes the ball that scored out, updates the score and serves a new one.
func new_round(ball):
	remove_child(ball)
	set_score()
	start()


# Whether body is the ball.
func body_is_ball(body):
	return body.name == "Ball"


func _ready():
	start()


func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()


# The ball in the left goal: a point for the right player.
func _on_goal_area_left_body_entered(body):
	if body_is_ball(body):
		right_point += 1
		new_round(body)


# The ball in the right goal: a point for the left player.
func _on_goal_area_right_body_entered(body):
	if body_is_ball(body):
		left_point += 1
		new_round(body)
