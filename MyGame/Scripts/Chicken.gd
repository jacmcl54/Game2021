extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 15
const MAXFALLSPEED = 350
const MAXSPEED = 150
const JUMPFORCE = 350
const ACCEL = 20

var motion = Vector2()
var facing_right = true

func _physics_process(_delta):
	
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	
	if facing_right == true:
		$Sprite.scale.x = -1
	else:
		$Sprite.scale.x = 1
	
	motion.x = clamp(motion.x,-MAXSPEED,MAXSPEED)
	
	if Input.is_action_pressed("right"):
		motion.x += ACCEL
		facing_right = true
		$Sprite/AnimationPlayer.play("Walk")
	elif Input.is_action_pressed("left"):
		motion.x -= ACCEL
		facing_right = false
		$Sprite/AnimationPlayer.play("Walk")
	else:
		motion.x = lerp(motion.x,0,0.2)
		$Sprite/AnimationPlayer.play("Idle")
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			motion.y = -JUMPFORCE
	
	if !is_on_floor():
		if motion.y < 0:
			$Sprite/AnimationPlayer.play("Jump")
		elif motion.y > 0:
			$Sprite/AnimationPlayer.play("Fall")
	
	motion = move_and_slide(motion, UP)
