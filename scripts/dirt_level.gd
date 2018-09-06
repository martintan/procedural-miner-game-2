extends Node

var chunk_width = 21
var chunk_height = 20
var center_pos = ceil(chunk_width / 2) * 100

onready var factory = preload("res://scenes/blocks/block_factory.tscn").instance()
onready var blocks_container = $BlocksContainer
onready var spawn_pos = get_node("../SpawnPos").position

signal generate_finish

func _ready():
	pass
	
func generate(spawn_pos):
	var start = spawn_pos
	var spawn = start
	for x in chunk_width:
		var block = factory.get_block(TILES.Blocks.Grass)
		blocks_container.add_child(block)
		block.position = spawn
		spawn.x += 100
		yield(get_tree(), "idle_frame")
	
	for y in chunk_height:
		spawn.x = start.x
		spawn.y += 100
		for x in chunk_width:
			var block = factory.get_block(TILES.Blocks.Dirt)
			blocks_container.add_child(block)
			block.position = spawn
			spawn.x += 100
		yield(get_tree(), "idle_frame")
		
	emit_signal("generate_finish")