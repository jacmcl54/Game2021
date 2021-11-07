extends Control


func _on_ToLevel2_pressed():
	get_tree().change_scene("res://Scenes/Level2.tscn")
	
func _on_MainMenu_pressed():
	get_tree().change_scene("res://Scenes/TitleScreen.tscn")
