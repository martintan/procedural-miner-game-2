extends Node2D

var chunk_width = 17
var chunk_height = 20

onready var factory = preload("res://scenes/blocks/block_factory.tscn").instance()
onready var dirt_level = preload("res://scenes/main/levels/dirt_level.tscn")

onready var static_tilemap = get_node("../static_tilemap")
onready var spawn_pos = $spawn_pos.position
#onready var blocks_container = get_node("../blocks")

func _ready():
#	generate_world()
	var start_level = dirt_level.instance()
	add_child(start_level)
	start_level.generate(spawn_pos)