extends Node2D

func _on_Area2D_body_entered(body):
	if body.name == ("Chicken"):
		yield(get_tree().create_timer(0.5), "timeout")
		get_tree().change_scene("res://Scenes/GameOver.tscn")
