extends Node

func random_range(value : int):
	return randi() % value - value / 2

func get_player():
	var players = get_tree().get_nodes_in_group("player")
	var player = players[0]
	return player