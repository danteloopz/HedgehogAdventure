extends Control


func _ready():
	pass


func _on_GoBackToMenu_pressed():
	get_tree().change_scene("res://Assets/Scenes/TitleMenu.tscn")


func _on_Volume_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),value)


func _on_SFX_value_changed(value):
	pass # Replace with function body.
