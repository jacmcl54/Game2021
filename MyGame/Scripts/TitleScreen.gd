extends Control

var begin_game

#BEGINS THE GAME
func _on_PlayButton_pressed():
	begin_game = get_tree().change_scene("res://Scenes/Level1.tscn")
	
