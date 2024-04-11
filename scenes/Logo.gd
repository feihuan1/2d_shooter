extends Sprite2D

# defind pos variable with a Vector2 type, set value to Vector2(0, 0)
var pos: Vector2 = Vector2.ZERO  

# define a const speed type of int, value to 10
const speed: int = 10

var test_scale: int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pos = Vector2(300, 200)
	position = pos  
	
	#var test_rotation = 45 
	#rotation_degrees = test_rotation
	
	test_scale = 2 
	scale = Vector2(test_scale, test_scale)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pos.x += speed
	position = pos 
# !!!!!With speed/10, since both speed and 10 are integers, the result of the division will also be an integer, resulting in 0.1. However, in integer division, the decimal part is discarded, so the result will be 0.
	#test_scale += 1
	#scale = Vector2(test_scale, test_scale)
