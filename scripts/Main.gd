extends Node2D

onready var Rock1 = load("res://scenes/Rock1.tscn")
onready var Rock2 = load("res://scenes/Rock2.tscn")
onready var Rock3 = load("res://scenes/Rock3.tscn")
onready var Rock4 = load("res://scenes/Rock4.tscn")
onready var Rock5 = load("res://scenes/Rock5.tscn")
onready var Rock6 = load("res://scenes/Rock6.tscn")

func _ready():
	randomize()
	generate_rocks(30)
	var rock_count = get_tree().get_nodes_in_group("rocks").size()
	print("number of rocks: " + str(rock_count))
	
func generate_rocks(count: int):
	for i in range(count):
		generate_rock(Rock1, Globals.random_range(32768), Globals.random_range(32768))
		generate_rock(Rock2, Globals.random_range(32768), Globals.random_range(32768))
		generate_rock(Rock3, Globals.random_range(32768), Globals.random_range(32768))
		generate_rock(Rock4, Globals.random_range(32768), Globals.random_range(32768))
		generate_rock(Rock5, Globals.random_range(32768), Globals.random_range(32768))
		generate_rock(Rock6, Globals.random_range(32768), Globals.random_range(32768))
	
func generate_rock(rock, x: int, y: int):
	var p = generate_something(rock, x, y)
	return p
	
func generate_something(something, x, y):
	var p = something.instance()
	add_child(p)
	p.position = Vector2(x, y)
	return p

