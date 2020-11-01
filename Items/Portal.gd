extends Node2D

var gotolevel = 0
var alllevels = ["res://Levels/Level1.tscn", "res://Levels/Level2.tscn"]

func _on_Area2D_body_entered(_body):
	gotolevel += 1
	get_tree().call_group("Gamestate", "new_level", alllevels[gotolevel])

