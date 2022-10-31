extends Area2D

signal hedgehog_hurted

func _on_Spikes_body_entered(body):
	$Death.play()
	emit_signal("hedgehog_hurted")
