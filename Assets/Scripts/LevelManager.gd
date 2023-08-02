extends Node

var current_level = 0

var Levels = [
	"res://Assets/Scenes/Level1.tscn",
	"res://Assets/Scenes/Level2.tscn"
]

func Scene_Load():
	get_tree().change_scene(Levels[current_level])

func Save_level():
	SaveSystem.data.level = current_level
	
func Change_level():
	current_level = current_level + 1
