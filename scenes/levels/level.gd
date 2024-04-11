extends Node2D

var test_array: Array[String] = ["test", 'hello', "world"]

func _ready(): 
	print('level is ready')
# targeting node
	get_node("Logo").rotation_degrees = 90
	$Logo.scale = Vector2(1, 1) 
	
	for i in test_array: 
		print(i)

func _process(_delta):
	$Logo.rotation_degrees += 10
# flow -> if statement

	
	if $Logo.position.x > 1000:
		# this get overwrited in Logo.gd so it wont work
		#$Logo.position.x = 0 
		# accessing variables in child node
		# variables defined in child node perform as attributes when accessing the node
		$Logo.pos.x = 0
