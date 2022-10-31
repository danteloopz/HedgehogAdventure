extends Node

var counter = 0

var Levels = [
	"res://Assets/Scenes/Level1.tscn",
	"res://Assets/Scenes/Level2.tscn"
]

func Scene_Load():
	get_tree().change_scene(Levels[counter])

func Save_level():
	SaveSystem.data.level = counter
	
func Counter_change():
	counter = counter + 1
