extends CanvasLayer

var coins = 0

func _ready():
	$CoinNumber.text = String(coins)
