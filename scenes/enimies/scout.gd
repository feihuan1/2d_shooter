extends CharacterBody2D

var player_nearby: bool = false
var can_laser: bool = true 
var right_gun_use: bool = true

var health: int = 30 
var can_damage: bool = true

signal laser(pos, direction)

func hit(): 
	if can_damage:
		health -= 10 
		can_damage = false
		$DamageCoolDown.start() 
		$Sprite2D.material.set_shader_parameter("progress", 1)
		
	if(health <= 0): 
		queue_free()

func _process(_delta):
	if player_nearby: 
		look_at(Globals.player_pos) 
		if can_laser: 
			var marker_node = $LaswerSpawnPositions.get_child(right_gun_use) 
			right_gun_use = not right_gun_use
			var pos:Vector2 = marker_node.global_position
			var direction: Vector2 = (Globals.player_pos - position).normalized()
			laser.emit(pos, direction) 
			can_laser = false 
			$LaserCoolDown.start()


func _on_area_2d_body_entered(_body):
	player_nearby = true


func _on_area_2d_body_exited(_body):
	player_nearby = false


func _on_laser_cool_down_timeout():
	can_laser = true


func _on_damage_cool_down_timeout():
	can_damage = true
	$Sprite2D.material.set_shader_parameter("progress", 0)
