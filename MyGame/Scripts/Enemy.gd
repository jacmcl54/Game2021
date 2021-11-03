extends KinematicBody2D

var velocity = Vector2()
export var direction = -1
export var detects_cliffs = true

func _ready():
	if direction == 1:
		$AnimatedSprite.flip_h = true
	$FloorChecker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	$FloorChecker.enabled = detects_cliffs

func _physics_process(delta):
	
	if is_on_wall() or not $FloorChecker.is_colliding() and detects_cliffs and is_on_floor():
		direction = direction * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		$FloorChecker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	
	velocity.y += 20
	
	velocity.x = 50 * direction
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
func _on_KinematicBody2D_body_entered(body):
	if body.name == ("Chicken"):
		yield(get_tree().create_timer(0.5), "timeout")
		get_tree().change_scene("res://Scenes/GameOver.tscn")
