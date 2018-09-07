extends KinematicBody2D

# physics properties
export(float) 	var gravity = 9.8
export(int) 	var gravity_modifier = 10
export(float) 	var move_speed = 1000

# floor normal for move_and_slide()
const floor_normal = Vector2(0, -1)
var velocity = Vector2()

func _ready():
#	$AnimationPlayer.play("idle")
	pass
	
func _process(delta):
	if Input.is_action_pressed("move_left"):
		velocity.x = -move_speed
	if Input.is_action_pressed("move_right"):
		velocity.x = move_speed
		
func _physics_process(delta):
	velocity.y += gravity * gravity_modifier
	velocity.x = lerp(velocity.x, 0, 0.5)
	if is_on_floor(): velocity.y = 0
	move_and_slide(velocity, floor_normal)
	