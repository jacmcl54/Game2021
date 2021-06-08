extends Area2D

func _on_Coin_body_entered(body):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Chicken":
			$AnimationPlayer.play("CoinTaken")
			yield($AnimationPlayer, "animation_finished")
			queue_free()
	body.add_coin()

func _ready():
	$AnimationPlayer.play("CoinIdle")

