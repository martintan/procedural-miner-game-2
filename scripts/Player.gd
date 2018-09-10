extends KinematicBody2D

# physics properties
export(float) var move_speed 		= 800
export(float) var jump_height 		= 250
export(float) var time_to_jump_apex = 0.325

# source: https://youtu.be/PlT44xr0iW0?t=446
onready var gravity 	= 2 * jump_height / pow(time_to_jump_apex, 2)
onready var jump_speed 	= abs(gravity) * time_to_jump_apex

# floor normal for move_and_slide()
const floor_normal = Vector2(0, -1)
var velocity = Vector2()
var is_moving = false

func _ready():
#	$AnimationPlayer.play("idle")
	pass
	
func _process(delta):
	is_moving = Input.is_action_pressed("move_left") || Input.is_action_pressed("move_right")
	if Input.is_action_pressed("move_left"):
		velocity.x = -move_speed
	if Input.is_action_pressed("move_right"):
		velocity.x = move_speed
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = -jump_speed
		
func _physics_process(delta):
	velocity.y += gravity * delta
	if not is_moving:
		velocity.x = lerp(velocity.x, 0, 0.5)
	velocity = move_and_slide(velocity, floor_normal)
	