extends Area2D

signal key_collected

func _on_Key_body_entered(body):
	$CollectedSound.play()
	$AnimationPlayer.play("Bounce")
	emit_signal("key_collected")
	set_collision_mask_bit(0,false)


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
