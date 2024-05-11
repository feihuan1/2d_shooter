extends StaticBody2D
class_name ItemContainer

#initally its facing down, we plus the rotation value to it
#wont work if not onready, it has to define after node rendered
@onready var current_direction: Vector2 = Vector2.DOWN.rotated(rotation)
var opened: bool = false
signal open(pos, direction)
