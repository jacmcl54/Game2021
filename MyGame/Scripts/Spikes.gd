extends Node2D

var spike_death

#DETECTS IF PLAYERS HAS TOUCHED A SPIKE AND WILL SHOW THE GAME OVER SCREEN
#IF THE PLAYER LOSES THEY WIILL NEED TO START THE WHOLE GAME AGAIN.
func _on_Area2D_body_entered(body):
	if body.name == ("Chicken"):
		yield(get_tree().create_timer(0.25), "timeout")
		spike_death = get_tree().change_scene("res://Scenes/GameOver.tscn")
