extends Node2D

var taken = false

func _on_Area2D_body_entered(body):
	if not taken:
		taken = true
		$AnimationPlayer.play("pick_coin")
		$AudioStreamPlayer.play()
		get_tree().call_group("Gamestate", "coin_up")

func pick_coin():
	queue_free()
