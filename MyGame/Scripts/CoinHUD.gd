extends CanvasLayer

var coins = 0

func _ready():
	$CoinNumber.text = String(coins)

func _physics_process(delta):
	if get_tree().current_scene.name == "Level1":
		OS.set_window_title("MyGame - Level 1")
		if coins == 6:
			yield(get_tree().create_timer(0.5), "timeout")
			get_tree().change_scene("res://Scenes/Level2.tscn")
			OS.alert("Congratulations, you passed the first stage!")
	if get_tree().current_scene.name == "Level2":
		OS.set_window_title("MyGame - Level 2")
		if coins == 3:
			yield(get_tree().create_timer(0.5), "timeout")
			get_tree().change_scene("res://Scenes/Level3.tscn")
	if get_tree().current_scene.name == "Level3":
		OS.set_window_title("MyGame - Level 3")
		if coins == 3:
			yield(get_tree().create_timer(0.5), "timeout")
			get_tree().change_scene("res://Scenes/Level1.tscn")

func _on_coin_collected():
	coins = coins + 1
	_ready()

func _on_BoxActive():
	$Panel.visible = false
	$TextureRect.visible = false
	$x.visible = false
	$CoinNumber.visible = false


func _on_BoxFinished():
	$Panel.visible = true
	$TextureRect.visible = true
	$x.visible = true
	$CoinNumber.visible = true
