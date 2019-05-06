extends Sprite

onready var animation = $AnimationPlayer

func _ready():
	animation.play("Explode")
	yield(animation, "animation_finished")
	queue_free()