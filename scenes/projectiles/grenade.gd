extends RigidBody2D


var speed = 750

func explode(): 
		$Explosion.visible = true
		$AnimationPlayer.play("Explosion")
