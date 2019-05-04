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
	var collision = move_and_collide(direction, false)
	if collision != null && collision.collider != null:
		if collision.collider.has_method("damage"):
			collision.collider.damage()
		queue_free()
	
	var now = OS.get_unix_time()
	if now - start_time > 1:
		queue_free()