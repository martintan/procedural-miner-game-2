extends Node2D

const breakable = [ "Stone", "Dirt", "Grass" ]
var block

func primary_attack(block):
	self.block = block
	print("attempting to break:", block, block.name)
	for b in breakable:
		if block.name.find(b) != -1:
			destroy_block()
	
func destroy_block():
	block.destroy()
