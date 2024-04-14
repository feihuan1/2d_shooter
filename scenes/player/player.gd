extends CharacterBody2D

signal laser 
signal grenade

var can_laser: bool = true
var can_grenade: bool = true

func _process(_delta): 
#this gives a vector of each direction
	var direction = Input.get_vector("left","right","up", "down")
	velocity = direction * 500
	move_and_slide() 
	
	
	#laser shooting input 
#action keep triger when pressed down
	if Input.is_action_pressed("primary action") and can_laser: 
		can_laser = false 
		$Timer.start()
		laser.emit()
	
#action JUST triger once
	if Input.is_action_just_pressed("secondary action") and can_grenade: 
		can_grenade = false	
		$GrenadeReloadTimer.start() 
		grenade.emit()


func _on_timer_timeout():
	can_laser = true



func _on_grenade_reload_timer_timeout():
	can_grenade = true
