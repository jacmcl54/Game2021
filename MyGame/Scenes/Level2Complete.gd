extends Control

var switch_level_3
var switch_mainmenu

#SENDS THE PLAYER TO THE NEXT LEVEL OR THE MAIN MENU
func _on_ToLevel3_pressed():
	switch_level_3 = get_tree().change_scene("res://Scenes/Level3.tscn")
func _on_MainMenu_pressed():
	switch_mainmenu = get_tree().change_scene("res://Scenes/TitleScreen.tscn")
