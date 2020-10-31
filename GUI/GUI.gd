extends CanvasLayer

func _ready():
	pass
	
func update_GUI(lives_left, coins_picked):
	$Control/TextureRect/HBoxContainer/LifeCount.text = str(lives_left)
	$Control/TextureRect/HBoxContainer/CoinCount.text = str(coins_picked)
