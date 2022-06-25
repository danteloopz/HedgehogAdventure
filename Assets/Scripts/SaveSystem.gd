extends Node

const SAVE_DIR = "user://saves/"

var save_path = SAVE_DIR + "save.dat"

export var data = {
"coins" : 0,
"last_checkpoint" : null,
"timer" : 0,
"deaths" : 0,
"level" : null,
}

func Save_Game():
	var dir = Directory.new()
	if !dir.dir_exists(SAVE_DIR):
		dir.make_dir_recursive(SAVE_DIR)

	var file = File.new()
	var error = file.open_encrypted_with_pass(save_path, File.WRITE, "You_can't_hack_m8")
	if error == OK:
		file.store_var(data)
		file.close()
		LevelManager.Scene_Save()
		get_tree().change_scene("res://Assets/Scenes/Intro.tscn")

func Load_GAME():
	var file = File.new()
	if file.file_exists(save_path):
		var error = file.open_encrypted_with_pass(save_path, File.READ, "You_can't_hack_m8")
		if error == OK:
			var player_data = file.get_var()
			file.close()
	LevelManager.Scene_Load()

func add_death():
	data.deaths += 1
	print("Death Counter:", data.deaths)

func add_coin():
	data.coins += 1
	print("Coin Counter:", data.coins)
