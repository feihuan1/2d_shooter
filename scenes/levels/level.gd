extends Node2D 
class_name LevelParent

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene =preload("res://scenes/projectiles/grenade.tscn")


func _on_gate_player_exited_gate(body):
	print('player exited gate: ', body)

func _on_player_laser(pos, direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos 
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	laser.direction = direction
	$Projectiles.add_child(laser)


func _on_player_grenade(pos, direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos  
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)
	



func _on_house_player_entered():
	var tween = get_tree().create_tween()
	#animation in tween play one after one, parallel will make them play at same time
	tween.set_parallel(true)
#set transition with set_trans
	tween.tween_property($Player/Camera2D, "zoom", Vector2(1, 1), 1).set_trans(Tween.TRANS_QUART)
#set start valu with "from"
	#tween.tween_property($Player, "modulate:a", 0, 1).from(0.5)


func _on_house_player_exited():
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.6, 0.6), 2)
	#tween.tween_property($Player, "modulate:a", 1, 1)
