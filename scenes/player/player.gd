extends CharacterBody2D

signal laser(pos, direction)
signal grenade(pos, direction) 


var can_laser: bool = true
var can_grenade: bool = true 

@export var max_speed: int = 1000 
var speed: int = max_speed


func hit(): 
	Globals.health -= 10 
	


func _process(_delta): 
#this gives a vector of each direction
	var direction = Input.get_vector("left","right","up", "down")
	velocity = direction * speed
	move_and_slide() 
	
	Globals.player_pos = global_position
# rotate 
	look_at(get_global_mouse_position())

	var player_direction = (get_global_mouse_position() - position).normalized()
	#laser shooting input 
#action keep triger when pressed down
	if Input.is_action_pressed("primary action") and can_laser and Globals.laser_amount > 0:
		Globals.laser_amount -= 1  
#ramdomly seclect marker2D for laser
		$GPUParticles2D.emitting = true
		var laser_markers = $LaserStartPositions.get_children() 
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		can_laser = false 
		$Timer.start()
#emit the position we selected
		laser.emit(selected_laser.global_position, player_direction)
	
#action JUST triger once
	if Input.is_action_just_pressed("secondary action") and can_grenade and Globals.grenade_amount > 0: 
		Globals.grenade_amount -= 1
		can_grenade = false	
		$GrenadeReloadTimer.start() 
		var pos = $LaserStartPositions.get_children()[0].global_position 
#calculate the angle of mouse from 0
		
		grenade.emit(pos, player_direction)


func _on_timer_timeout():
	can_laser = true

func _on_grenade_reload_timer_timeout():
	can_grenade = true

