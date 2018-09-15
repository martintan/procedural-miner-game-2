extends Camera2D

var speed = 2000
var move = Vector2()

func _input(event):
	move = Vector2()
	if Input.is_key_pressed(KEY_I):
		move.y = -speed
	if Input.is_key_pressed(KEY_K):
		move.y = speed
	if Input.is_key_pressed(KEY_J):
		move.x = -speed
	if Input.is_key_pressed(KEY_L):
		move.x = speed
		
func _process(delta):
	translate(move * delta)