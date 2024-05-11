extends Node

signal stat_change

var laser_amount = 20:
	set(value): 
		laser_amount = value
		stat_change.emit()
		
var grenade_amount = 8: 
	set(value): 
		grenade_amount = value
		stat_change.emit()

var player_vulnaerable: bool = true
var health = 60: 
	set(value): 
		if value > health: 
			health = min(value, 100) 
		else:
			if player_vulnaerable:
				health = value  
				player_vulnaerable = false
				player_vulnaerable_timer()
		stat_change.emit()

func player_vulnaerable_timer(): 
	await get_tree().create_timer(0.5).timeout 
	player_vulnaerable = true

var player_pos: Vector2
