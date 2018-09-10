extends Node2D

#onready var tools = { "PICKAXE": $Pickaxe, "SHOVEL": $Shovel }
var direction = Vector2(0, 1)

func _ready():
	pass
	
func on_primary_attack(tool_idx):
	var space_state = get_world_2d().direct_space_state
	var result = space_state.intersect_ray(global_position, global_position + direction.normalized() * 200, [get_parent()])
	if not result.empty():
		var collider = result.collider
		if collider.is_in_group("breakable"):
		#	var t = tools[tool_idx]
			var t = $DefaultPickaxe
			t.primary_attack(collider)
			
func _input(event):
	if event is InputEventMouseMotion:
		direction = get_global_mouse_position() - global_position
		update()
		
func _draw():
	draw_line(position, direction.normalized() * 200, Color(0, 0, 0), 1)
	
func _process(delta):
	if Input.is_action_pressed("tool_1") and $Cooldown.is_stopped():
		on_primary_attack("PICKAXE")
		$Cooldown.start()
		
	elif Input.is_action_just_pressed("tool_2"):
		on_primary_attack("SHOVEL")
		
	elif Input.is_action_just_pressed("tool_3"):
		pass