extends Area2D

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Chicken":
			$AnimationPlayer.play("CoinTaken")
			yield($AnimationPlayer, "animation_finished")
			queue_free()
func _ready():
	$AnimationPlayer.play("CoinIdle")



