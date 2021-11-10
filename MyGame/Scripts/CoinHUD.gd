extends CanvasLayer

var coins = 0
var switch_win1
var switch_win2
var switch_win3
var switch_mainmenu

func _ready():
	$CoinNumber.text = String(coins)


#CHECKS THE AMOUNT OF COINS COLLECTED TO SEE IF PLAYER CAN PROCEED
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

#ADDS 1 TO THE COIN COUNTER
func _on_coin_collected():
	coins = coins + 1
	_ready()

#HIDES THE COINHUD WHEN THE 'HOW TO PLAY' DIALOGUE BOX APPEARS
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
