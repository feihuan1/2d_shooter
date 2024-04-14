extends Node2D





func _on_gate_player_entered_gate(body):
	print('player entered gate: ', body)


func _on_player_laser():
	print("shoot laser")


func _on_player_grenade():
	print('throw grenade')


func _on_gate_player_exited_gate(body):
	print('player exited gate: ', body)
