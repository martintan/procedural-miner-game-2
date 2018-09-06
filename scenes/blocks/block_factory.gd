extends Node

func _ready():
	randomize()
	
func get_random_block():
	return get_child( floor(rand_range(0, get_child_count()-1)) ).duplicate()
	
func get_block(index):
	return get_child(index).duplicate()
