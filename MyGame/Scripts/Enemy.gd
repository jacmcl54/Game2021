extends KinematicBody2D

var velocity = Vector2()
export var direction = -1
export var detects_cliffs = true
var enemy_death

#GETS THE ENEMY TO FACE THE RIGHT WAY AND TO DETECT EDGES OF CLIFFS (IF TURNED ON)
func _ready():
	if direction == 1:
		$AnimatedSprite.flip_h = true
	$FloorChecker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	$FloorChecker.enabled = detects_cliffs

func _physics_process(delta):
	#FLIPS THE ENEMY AROUND WHEN THEY COLLIDE WITH A WALL OR DETECT A CLIFF
	if is_on_wall() or not $FloorChecker.is_colliding() and detects_cliffs and is_on_floor():
		direction = direction * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		$FloorChecker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	
	#WALK AND FALL SPEEDS FOR ENEMY
	velocity.y += 20
	velocity.x = 50 * direction
	velocity = move_and_slide(velocity, Vector2.UP)
	
#END THE GAME IF A PLAYER TOUCHES AN ENEMY (DOES NOT WORK)
func _on_KinematicBody2D_body_entered(body):
	if body.name == ("Chicken"):
		yield(get_tree().create_timer(0.5), "timeout")
		enemy_death = get_tree().change_scene("res://Scenes/GameOver.tscn")
