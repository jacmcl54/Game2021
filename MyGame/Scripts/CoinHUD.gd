extends CanvasLayer

var coins = 0

func _ready():
	$CoinNumber.text = String(coins)

func _physics_process(delta):
	if coins == 3:
		yield(get_tree().create_timer(0.5), "timeout")
		get_tree().change_scene("res://Scenes/Level1.tscn")

func _on_coin_collected():
	coins = coins + 1
	_ready()
