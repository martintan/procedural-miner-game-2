extends KinematicBody2D

# physics properties
export(float) 	var move_speed = 1000
export(float) 	var jump_height = 250
export(float)	var time_to_jump_apex = 0.325

onready var gravity 	= 2 * jump_height / pow(time_to_jump_apex, 2)
onready var jump_speed 	= abs(gravity) * time_to_jump_apex

# floor normal for move_and_slide()
const floor_normal = Vector2(0, -1)
var velocity = Vector2()

func _ready():
#	$AnimationPlayer.play("idle")
	print(gravity)
	pass
	
func _process(delta):
	if Input.is_action_pressed("move_left"):
		velocity.x = -move_speed
	if Input.is_action_pressed("move_right"):
		velocity.x = move_speed
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = -jump_speed
#	if not Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_right"):
#		velocity.x = lerp(velocity.x, 0, 10* delta)
		
		
func _physics_process(delta):
	# source: https://youtu.be/PlT44xr0iW0?t=446
	velocity.y += gravity * delta
	if !Input.is_action_pressed("move_left") and !Input.is_action_pressed("move_right"):
		velocity.x = lerp(velocity.x, 0, 0.5)
	velocity = move_and_slide(velocity, floor_normal)
	