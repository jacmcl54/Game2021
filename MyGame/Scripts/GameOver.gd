extends Control

var quit_game
var switch_mainmenu

#QUITS THE GAME OR GOES TO THE MAIN MENU
func _on_QuitButton_pressed():
	quit_game = get_tree().quit()
func _on_MainMenu_pressed():
	switch_mainmenu = get_tree().change_scene("res://Scenes/TitleScreen.tscn")
