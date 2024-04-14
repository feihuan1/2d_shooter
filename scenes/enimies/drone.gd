extends CharacterBody2D


func _process(_delta): 
# or Vector2.RIGHT
	var direction = Vector2(1, 0) 
	
	velocity = direction * 100 
	
	move_and_slide()
