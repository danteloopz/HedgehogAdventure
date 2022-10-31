extends Node

var counter = 0

var Levels = [
	"res://Assets/Scenes/Level1.tscn",
	"res://Assets/Scenes/Level2.tscn"
]

func Scene_Load():
	get_tree().change_scene(Levels[counter])
	counter = counter + 1
