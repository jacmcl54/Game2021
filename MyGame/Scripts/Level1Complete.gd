extends Control

var switch_level_2
var switch_mainmenu

#SENDS THE PLAYER TO THE NEXT LEVEL OR THE MAIN MENU
func _on_ToLevel2_pressed():
	switch_level_2 = get_tree().change_scene("res://Scenes/Level2.tscn")
func _on_MainMenu_pressed():
	switch_mainmenu = get_tree().change_scene("res://Scenes/TitleScreen.tscn")
