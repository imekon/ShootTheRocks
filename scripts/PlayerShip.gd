extends KinematicBody2D

const MOVEMENT = 700.0

var thrust: float = 0.0
var fire_cycle: int = 0
var last_fired: int = 0

onready var Bullet = load("res://scenes/Bullet.tscn")
onready var left_position = $LeftPosition
onready var firing_position = $FirePosition
onready var right_position = $RightPosition

func _physics_process(delta):
	var angle: float = 0.0
	
	if Input.is_action_pressed("move_forward"):
		thrust = MOVEMENT * delta
	if Input.is_action_pressed("move_backward"):
		thrust = -MOVEMENT * delta * 0.25
	if Input.is_action_pressed("turn_left"):
		angle = -2
	if Input.is_action_pressed("turn_right"):
		angle = 2
		
	if Input.is_action_pressed("fire"):
		process_fire()
		
	var rot = rotation_degrees

	var direction = Vector2(thrust, 0).rotated(deg2rad(rot))
	move_and_collide(direction, false)
	
	rotate(deg2rad(angle))

	thrust *= 0.99
	
func process_fire():
	var now = OS.get_ticks_msec()
	if now - last_fired > 100:
		var bullet = Bullet.instance()
		match fire_cycle:
			0:
				bullet.position = firing_position.global_position
			1:
				bullet.position = left_position.global_position
			2:
				bullet.position = right_position.global_position

		fire_cycle += 1
		if fire_cycle > 2:
			fire_cycle = 0
		bullet.rotate(rotation)
		get_parent().add_child(bullet)
		last_fired = now