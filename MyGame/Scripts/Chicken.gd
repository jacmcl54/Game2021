extends KinematicBody2D

#SETS THE DESIRED VELOCITIES AND ACCELERATION FOR THE CHCIKEN, HAS BEEN ADJUSTED TO WORK BEST FOR THIS GAME.
const UP = Vector2(0, -1)
const GRAVITY = 15
const MAXFALLSPEED = 350
const MAXSPEED = 150
const JUMPFORCE = 350
const ACCEL = 20

var coins = 0
var motion = Vector2()
var facing_right = true
var quit_game
var restart_level

func _physics_process(_delta):
	#SETTING THE FALL SPEED TO GRAVITY
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	#GETS THE CHICKEN TO FACE THE CORRECT DIRECTION
	if facing_right == true:
		$Sprite.scale.x = -1
	else:
		$Sprite.scale.x = 1
	
	motion.x = clamp(motion.x,-MAXSPEED,MAXSPEED)
	
	#Movement
	if Input.is_action_pressed("right"):
		motion.x += ACCEL
		facing_right = true
		$Sprite/AnimationPlayer.play("Walk")
	elif Input.is_action_pressed("left"):
		motion.x -= ACCEL
		facing_right = false
		$Sprite/AnimationPlayer.play("Walk")
	#LETS THE PLAYER QUIT OR RESTART THE GAME WHENEVER THEY WANT
	elif Input.is_action_pressed("restart"):
		restart_level = get_tree().reload_current_scene()
	elif Input.is_action_pressed("quit"):
		quit_game = get_tree().quit()
	else:
		motion.x = lerp(motion.x,0,0.2)
		$Sprite/AnimationPlayer.play("Idle")
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			motion.y = -JUMPFORCE
	
	#Detects if chicken is on floor to play jump and fall animations
	if !is_on_floor():
		if motion.y < 0:
			$Sprite/AnimationPlayer.play("Jump")
		elif motion.y > 0:
			$Sprite/AnimationPlayer.play("Fall")
	
	motion = move_and_slide(motion, UP)

