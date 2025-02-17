extends Node2D

var lives = 3
var coins = 0
var coins_for_life = 10

func _ready():
	add_to_group("Gamestate")
	update_GUI()


func hurt():
	lives -= 1
	$Player.hurt()
	update_GUI()
	if lives <= 0:
		end_game()


func coin_up():
	coins += 1
	update_GUI()
	var new_life_coins = (coins % coins_for_life == 0)
	if new_life_coins:
		life_up()


func life_up():
	lives += 1
	update_GUI()


func update_GUI():
	get_tree().call_group("GUI", "update_GUI", lives, coins)


func new_level(gotolevel):
	get_tree().change_scene(gotolevel)


func win_game():
	get_tree().change_scene("res://Levels/Victory.tscn")


func end_game():
	get_tree().change_scene("res://Levels/GameOver.tscn")

