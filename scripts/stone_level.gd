extends Node

var chunk_width = 21
var chunk_height = 20
var center_pos = (round(chunk_width / 2) * 100) + 50

onready var factory = preload("res://scenes/blocks/block_factory.tscn").instance()
onready var blocks_container = $Blocks
onready var spawn_pos = get_node("../SpawnPos").position

signal generate_finish

func _ready():
	pass
	
func generate(spawn_pos):
	var spawn = spawn_pos
	for y in chunk_height:
		spawn.x = spawn_pos.x
		spawn.y += 100
		for x in chunk_width:
			var block = factory.get_block(TILES.Blocks.Stone)
			blocks_container.add_child(block)
			block.position = spawn
			spawn.x += 100
		yield(get_tree(), "idle_frame")
	emit_signal("generate_finish", Vector2(spawn_pos.x, spawn.y+100))