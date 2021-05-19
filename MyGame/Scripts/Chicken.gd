extends KinematicBody2D

#V1----------------------------------

#var moving = false
#export var SPEED = 75
#
#func _process(delta):
#	moving = false
#	if Input.is_action_pressed("ui_left"):
#		move(-SPEED, 0, delta, true)
#		$Sprite.flip_h = false
#	if Input.is_action_pressed("ui_right"):
#		move(SPEED, 0, delta)
#		$Sprite.flip_h = true
#	if Input.is_action_pressed("ui_up"):
#		move(0, -SPEED, delta)
#	if Input.is_action_pressed("ui_down"):
#		move(0, SPEED, delta)
#
#	if moving:
#		$AnimationPlayer.play("ChickenWalk")
#	else:
#		$AnimationPlayer.play("Idle")
#
#func move(xspeed, yspeed, delta, _flip = false):
#	position.x += xspeed * delta
#	position.y += yspeed * delta
#	moving = true
#
#func _ready():
#	pass

#V2----------------------------------

const UP = Vector2(0, -1)
const SLOPE_STOP = 64

var velocity = Vector2()
var move_speed = 200
var gravity = 900
var jump_velocty = -600
var is_grounded
var anim_player
var moving = false
var facing_right = true

onready var raycasts = $Raycasts

func _physics_process(delta):
	_get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, UP, SLOPE_STOP)
	is_grounded = _check_is_grounded()
	if moving:
		$AnimationPlayer.play("ChickenWalk")
	else:
		$AnimationPlayer.play("Idle")
	if facing_right == true:
		$Sprite.scale.x = 1
	else:
		$Sprite.scale.x = -1

func _input(event):
	if event.is_action_pressed("jump") && is_grounded:
		velocity.y = jump_velocty

func _get_input():
	var move_direction = -int(Input.is_action_pressed("ui_left")) + int(Input.is_action_pressed("ui_right"))
	velocity.x = lerp(velocity.x, move_speed * move_direction, _get_h_weight())
	#if move_direction != 0:
		#$Sprite.scale.x = move_direction

func _get_h_weight():
	return 0.2 if is_grounded else 0.1

func _check_is_grounded():
	for raycast in raycasts.get_children():
		if raycast.is_colliding():
			return true
	return false

#func move(xspeed, yspeed, delta, _flip = false):
#	position.x += xspeed * delta
#	position.y += yspeed * delta
#	moving = true
