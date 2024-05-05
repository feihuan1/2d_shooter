extends CanvasLayer

var green: Color = Color("6bbfa3")
var red: Color = Color(0.9, 0,0,1)

#run this line once the scene is ready, same as func _ready but it's global scoup
@onready var laser_label: Label = $LaserCounter/VBoxContainer/Label
@onready var laser_icon: TextureRect = $LaserCounter/VBoxContainer/TextureRect
@onready var grenade_label: Label = $GenadeCounter/VBoxContainer/Label
@onready var grenade_icon: TextureRect = $GenadeCounter/VBoxContainer/TextureRect

func _ready():
	update_laser_text()
	update_grenade_text()

func update_laser_text(): 
	laser_label.text = str(Globals.laser_amount)
	update_color(Globals.laser_amount, laser_label, laser_icon)


func update_grenade_text(): 
	grenade_label.text = str(Globals.grenade_amount)
	update_color(Globals.grenade_amount, grenade_label, grenade_icon)


func update_color(amount: int, label: Label, icon: TextureRect)-> void:
	if amount <= 0:
		label.modulate = red
		icon.modulate = red 
	else:
		label.modulate = green
		icon.modulate = green
