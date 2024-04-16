extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene =preload("res://scenes/projectiles/grenade.tscn")


func _on_gate_player_entered_gate(body):
	print('player entered gate: ', body)


func _on_gate_player_exited_gate(body):
	print('player exited gate: ', body)

func _on_player_laser(pos):
	var laser = laser_scene.instantiate()   
# 1. update laser position 
	laser.position = pos
# 2. move the laser 
# 3. add laser instance to a Node2D
	$Projectiles.add_child(laser)


func _on_player_grenade(pos):
	var grenade = grenade_scene.instantiate() 
	grenade.position = pos 
	$Projectiles.add_child(grenade)
	

