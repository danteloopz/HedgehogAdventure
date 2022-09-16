extends Node2D


func _ready():
	Pause.is_pausable = true
	MusicController.stop_music()
	$TransisionScreen.fadeout()
	if SaveSystem.data.last_checkpoint == null:
		SaveSystem.data.last_checkpoint = $Hedgehog.global_position
	else:
		$Hedgehog.global_position = SaveSystem.data.last_checkpoint + Vector2(0,-40)
	


func _on_Hedgehog_change_hh_spawn():
	$Hedgehog.global_position = SaveSystem.data.last_checkpoint + Vector2(0,-40)
