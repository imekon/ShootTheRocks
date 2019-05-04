extends RigidBody2D

const ACCELERATION = 150

export var health = 200

func _ready():
	add_to_group("rocks")
	
	var angle = randf() * 360.0
	apply_impulse(Vector2(), Vector2(0, -ACCELERATION).rotated(deg2rad(angle)))

func damage():
	health -= 30
	if health < 0:
		queue_free()
