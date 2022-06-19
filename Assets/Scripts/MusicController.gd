extends Node

var menu_music = load("res://Assets/Music/Mainmenu.mp3")

func _ready():
	pass
	
func play_music():
	
	$Music.stream = menu_music
	$Music.play()
