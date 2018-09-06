# Stone
extends StaticBody2D

signal destroyed

func _ready():
	pass

func destroy():
	emit_signal("destroyed", self)
	queue_free()