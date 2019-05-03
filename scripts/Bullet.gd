extends KinematicBody2D

const MOVEMENT = 1000.0

var start_time

func _ready():
	start_time = OS.get_unix_time()
	add_to_group("bullet")

func _physics_process(delta):
	var thrust = MOVEMENT * delta
	var rot = rotation_degrees
	var direction = Vector2(thrust, 0).rotated(deg2rad(rot))
	move_and_collide(direction)
	
	var now = OS.get_unix_time()
	if now - start_time > 1:
		queue_free()