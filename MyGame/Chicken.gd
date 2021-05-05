extends Area2D

var moving = false
export var SPEED = 75

func _process(delta):
	moving = false
	if Input.is_action_pressed("ui_left"):
		move(-SPEED, 0, delta, true)
	if Input.is_action_pressed("ui_right"):
		move(SPEED, 0, delta)
	if Input.is_action_pressed("ui_up"):
		move(0, -SPEED, delta)
	if Input.is_action_pressed("ui_down"):
		move(0, SPEED, delta)
	
	if moving:
		$AnimationPlayer.play("ChickenWalk")
	else:
		$AnimationPlayer.play("Idle")

func move(xspeed, yspeed, delta, flip = false):
	position.x += xspeed * delta
	position.y += yspeed * delta
	moving = true
	$Sprite.flip_h = flip

func _ready():
	pass
