extends LevelParent



func _on_gate_player_entered_gate(_body):
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 0.3)
	call_deferred("change_level")

func change_level(): 
	TransitionLayer.change_scene("res://scenes/levels/inside.tscn")
