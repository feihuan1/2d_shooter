extends RigidBody2D


var speed = 750
var explosion_active: bool = false
var explosion_radius: int = 300

func explode():  
	$Explosion.show()
	$AnimationPlayer.play("Explosion") 
	explosion_active = true
	linear_velocity = Vector2.ZERO
	angular_velocity = 0

func _ready():
	$Sprite2D.show() 
	$Explosion.hide()

func _process(_delta): 
	if explosion_active: 
		var targets = get_tree().get_nodes_in_group("Container") + get_tree().get_nodes_in_group("Entity")
		for target in targets: 
			var in_range = target.global_position.distance_to(global_position) < explosion_radius
			if "hit" in target and in_range:
				target.hit()
