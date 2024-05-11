extends LevelParent



func _on_gate_player_entered_gate(_body):
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 0.3)
	call_deferred("change_level")

func change_level(): 
	TransitionLayer.change_scene("res://scenes/levels/inside.tscn")

func _on_house_player_entered():
	var tween = get_tree().create_tween()
	#animation in tween play one after one, parallel will make them play at same time
	tween.set_parallel(true)
#set transition with set_trans
	tween.tween_property($Player/Camera2D, "zoom", Vector2(1, 1), 1).set_trans(Tween.TRANS_QUART)
#set start valu with "from"
	#tween.tween_property($Player, "modulate:a", 0, 1).from(0.5)


func _on_house_player_exited():
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.6, 0.6), 2)
	#tween.tween_property($Player, "modulate:a", 1, 1)
