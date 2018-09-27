extends TileMap

onready var LevelFactory = preload("res://scenes/main/level_factory.tscn").instance()
#var tiles = []

func _ready():
	var start = $SpawnPos.position
	var spawn = Vector2()
	spawn.y = world_to_map(start).y
	for y in 20:
		spawn.x = start.x
		for x in 10:
			set_cell(spawn.x, spawn.y, global.Tileset.Dirt)
			spawn.x += 1
		spawn.y += 1
#		yield(get_tree(), "idle_frame")
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
