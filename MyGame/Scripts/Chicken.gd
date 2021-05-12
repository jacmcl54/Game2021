extends KinematicBody2D

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

const UP = Vector2(0, -1)

var velocity = Vector2()
var move_speed = 5 * 96


func _physics_process(delta):
		
		move_and_slide(velocity, UP)

func _get_input():
	var move_direction = -int(Input.is_action_pressed("move_left")) + int(Input.is_action_pressed("move_right"))
	velocity.x = lerp(velocity.x, move_speed * move_direction, 0.2)
