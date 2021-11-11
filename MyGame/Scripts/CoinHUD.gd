extends CanvasLayer

#SETS THE AMOUNT OF COINS COLELCTED TO ZERO EACH TIME A GAME OR LEVEL IS STARTED.
var coins = 0
#VARIABLES BELOW ARE USED FOR CHANGING SCENES TO PREVENT ERRORS.
var switch_win1
var switch_win2
var switch_win3
var switch_mainmenu

#GETS THE COIN HUD TO DISPLAY THE AMOUNT OF COINS COLLECTED BY USING THE 'COINS' VARIABLE.
func _ready():
	$CoinNumber.text = String(coins)


#CHECKS THE AMOUNT OF COINS COLLECTED TO SEE IF PLAYER CAN PROCEED, 
#IF THE PLAYER HAS COLLECTED 3 COINS IN THE CURRENT LEVEL, THEY WILL SEE A WIN SCREEN AFTER A 0.5S DELAY.
#THE WINDOW TITLE WILL CHANGE ITS NAME TO MATCH THE CORRESPONDING LEVEL.
func _physics_process(delta):
	if get_tree().current_scene.name == "Level1":
		OS.set_window_title("MyGame - Level 1")
		if coins == 3:
			yield(get_tree().create_timer(0.5), "timeout")
			switch_win1 = get_tree().change_scene("res://Scenes/Level1Complete.tscn")
			return
	elif get_tree().current_scene.name == "Level2":
		OS.set_window_title("MyGame - Level 2")
		if coins == 3:
			yield(get_tree().create_timer(0.5), "timeout")
			switch_win2 = get_tree().change_scene("res://Scenes/Level2Complete.tscn")
			return
	elif get_tree().current_scene.name == "Level3":
		OS.set_window_title("MyGame - Level 3")
		if coins >= 3:
			yield(get_tree().create_timer(0.5), "timeout")
			switch_win3 = get_tree().change_scene("res://Scenes/Level3Complete.tscn")
			return

#ADDS 1 TO THE 'COINS' VARIABLE, THEN TELLS THE '$COINNUMBER' NODE TO UPDATE NUMBER.
func _on_coin_collected():
	coins = coins + 1
	_ready()

#HIDES THE COINHUD WHEN THE 'HOW TO PLAY' DIALOGUE BOX APPEARS.
#THE COIN HUD WILL STILL COUNT WHILE IT IS NOT VISIBLE.
func _on_BoxActive():
	$Panel.visible = false
	$TextureRect.visible = false
	$x.visible = false
	$CoinNumber.visible = false
#MAKES THE COIN HUD VISIABLE AGAIN AFTER THE DIALOGUE BOX DISSAPEARS
func _on_BoxFinished():
	$Panel.visible = true
	$TextureRect.visible = true
	$x.visible = true
	$CoinNumber.visible = true
