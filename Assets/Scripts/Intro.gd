extends Node


func _ready():
	MusicController.play_music()
	get_tree().change_scene("res://Assets/Scenes/TitleMenu.tscn")
