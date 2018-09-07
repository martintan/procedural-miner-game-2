extends Node2D

onready var factory = preload("res://scenes/blocks/block_factory.tscn").instance()
onready var dirt_level = preload("res://scenes/main/levels/dirt_level.tscn")
onready var player_scn = preload("res://entities/player/Player.tscn")

onready var static_tilemap = get_node("../StaticTiles")
onready var spawn_pos = $SpawnPos.position

var center_pos = Vector2()

func _ready():
	var start_level = dirt_level.instance()
	start_level.connect("generate_finish", self, "on_generate_finish")
	center_pos = start_level.center_pos
	add_child(start_level)
	start_level.generate(spawn_pos)
	
func on_generate_finish():
	var player = player_scn.instance()
	get_node("../Entities").add_child(player)
	player.position = Vector2(center_pos, spawn_pos.y-100)
	var cam = get_node("../Camera2D")
	get_parent().remove_child(cam)
	player.add_child(cam)
	cam.position = Vector2()
#	cam.zoom = Vector2(2, 2)
	cam.get_node("AnimationPlayer").play("smooth_zoom")
	