extends Node2D

#onready var tools = { "PICKAXE": $Pickaxe, "SHOVEL": $Shovel }
var direction = Vector2(0, 1)

func _ready():
	pass
	
func on_primary_attack(tool_idx):
	var in_range = $AttackRange.get_overlapping_bodies()
#	var t = tools[tool_idx]
	var t = $DefaultPickaxe
	if in_range.size() > 0 and t != null:
		t.primary_attack(in_range.pop_front())
	
func _process(delta):
	if Input.is_action_just_pressed("tool_1"):
		on_primary_attack("PICKAXE")
		
	elif Input.is_action_just_pressed("tool_2"):
		on_primary_attack("SHOVEL")
		
	elif Input.is_action_just_pressed("tool_3"):
		pass
