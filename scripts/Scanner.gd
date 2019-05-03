extends Panel

onready var scanner = $Control
onready var label = $Label

export var scanner_type: int = 1

func _ready():
	match scanner_type:
		1:
			scanner.set_short_range_scan()
			label.text = "Short Range"
		2:
			scanner.set_medium_range_scan()
			label.text = "Medium Range"
		3:
			scanner.set_long_range_scan()
			label.text = "Long Range"
