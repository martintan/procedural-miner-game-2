extends Node

func get_level(level_name):
	return get_node(level_name).duplicate()