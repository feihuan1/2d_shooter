extends Area2D

var rotation_speed: int = 3 
var available_options = ['laser','laser','laser','laser', 'grenade', 'health'] 
var type = available_options[randi() % len(available_options)]

func _ready(): 
	if type == 'laser': 
		$Sprite2D.modulate = Color(0.1,0.2,0.6)
	elif type == 'grenade': 
		$Sprite2D.modulate = Color(0.6,0.2,0.1) 
	elif type == 'health': 
		$Sprite2D.modulate = Color(0.1,0.6,0.2)

func _process(delta):
	rotation += rotation_speed * delta


func _on_body_entered(_body):
	if type == 'health': 
		Globals.health += 10
	if type == 'laser': 
		Globals.laser_amount += 20
	if type == 'grenade': 
		Globals.grenade_amount += 5
	queue_free()