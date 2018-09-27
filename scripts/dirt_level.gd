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
	var start = spawn_pos
	var spawn = start
	for x in chunk_width:
		var block = factory.get_block(global.Blocks.Grass)
		blocks_container.add_child(block)
		block.position = spawn
		spawn.x += 100
		yield(get_tree(), "idle_frame")
	
	for y in chunk_height:
		spawn.x = start.x
		spawn.y += 100
		for x in chunk_width:
			var block = factory.get_block(global.Blocks.Dirt)
			blocks_container.add_child(block)
			block.position = spawn
			spawn.x += 100
		yield(get_tree(), "idle_frame")
		
	# put x back to beginning coordinate
	emit_signal("generate_finish", Vector2(start.x, spawn.y+100))