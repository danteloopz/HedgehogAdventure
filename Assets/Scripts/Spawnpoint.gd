extends Area2D

var interactable := true
signal save_coins

func _ready():
	$AnimatedSprite.play("Idle")

func _on_Spawnpoint_body_entered(body):
	if interactable == true:
		$SpawnpointEntered.play()
		$AnimationPlayer.play("Entered")
		LevelManager.Change_level()
		emit_signal("save_coins")
		set_collision_mask_bit(0,false)
		interactable = false
		$"/root/LevelManager".Change_level()


func _on_AnimationPlayer_animation_finished(anim_name):
	SaveSystem.data.last_checkpoint = $CheckpointPos.global_position
	print("New spawnpont:", SaveSystem.data.last_checkpoint)
