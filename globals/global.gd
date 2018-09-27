extends Node

enum Tileset { Dirt, Stone, GrassBlock, DirtCaveBg }
enum Blocks { Dirt, Stone, Marble, Grass }

onready var tilemap setget , get_tilemap

func get_tilemap():
	return get_tree().get_root().get_child(1).get_node("TileMap")
	pass