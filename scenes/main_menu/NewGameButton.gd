# The main menu's New Game button.
extends Button


# Opens the playground.
func _on_pressed():
	get_tree().change_scene_to_file("res://scenes/playground/Playground.tscn")	
	

