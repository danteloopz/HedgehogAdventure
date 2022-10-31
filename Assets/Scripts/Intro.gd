extends Node


func _ready():
	MusicController.play_music()
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Assets/Scenes/TitleMenu.tscn")
