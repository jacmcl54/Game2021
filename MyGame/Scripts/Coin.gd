extends Area2D

signal coin_collected

func _on_Coin_body_entered(body):
	$AnimationPlayer.play("CoinTaken")
	emit_signal("coin_collected")
	print("Coin collected")
	set_collision_mask_bit(0, false)

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
