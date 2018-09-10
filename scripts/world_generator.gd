extends Node2D

onready var factory 		= preload("res://scenes/blocks/block_factory.tscn").instance()
onready var level_factory 	= preload("res://scenes/main/level_factory.tscn").instance()
onready var player_scn 		= preload("res://entities/player/Player.tscn")

onready var static_tilemap 	= get_node("../StaticTiles")
onready var spawn_pos 		= $SpawnPos.position

var center_pos = Vector2()

func _ready():
	var start_level = level_factory.get_level("DirtLevel")
	start_level.connect("generate_finish", self, "on_generate_finish")
	center_pos = start_level.center_pos
	add_child(start_level)
	start_level.generate(spawn_pos)
	
	yield(start_level, "generate_finish")

	var next_level = level_factory.get_level("StoneLevel")
	next_level.connect("generate_finish", self, "on_generate_finish")
	add_child(next_level)
	next_level.generate(spawn_pos)
	
func _process(delta):
#	var player_pos = player.globel_position	
	pass
	
func on_generate_finish(end_pos):
	var player = player_scn.instance()
	get_node("../Entities").add_child(player)
	player.position = Vector2(center_pos, spawn_pos.y-100)
	spawn_pos = end_pos
#	player.position = end_pos
	