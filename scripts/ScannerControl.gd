extends Control

var tracking_width: float
var tracking_height: float

var tracking_range: float = 10000.0
var tracking_range2: float
var tracking_ratio: float

func _ready():
	tracking_width = rect_size.x
	tracking_height = rect_size.y
	tracking_range2 = tracking_range / 2.0
	tracking_ratio = tracking_height / tracking_range
	
func _process(delta):
	update()
	
func _draw():
	var rect = Rect2(tracking_width / 2.0, tracking_height / 2.0, 4.0, 4.0)
	var colour = Color(1.0, 0.0, 0.0)
	draw_rect(rect, colour)
	
	var players = get_tree().get_nodes_in_group("player")
	var player = players[0]
	var player_pos = player.position
	
	colour = Color(0.0, 1.0, 0.0)
	
	var rocks = get_tree().get_nodes_in_group("rocks")
	for rock in rocks:
		var pos = rock.global_position
		var dist = player_pos.distance_to(pos)
		if dist < tracking_range2:
			var x = (pos.x - player_pos.x) * tracking_ratio + tracking_width / 2.0
			var y = (pos.y - player_pos.y) * tracking_ratio + tracking_height / 2.0
			rect = Rect2(x - 1, y - 1, 3, 3)
			draw_rect(rect, colour)