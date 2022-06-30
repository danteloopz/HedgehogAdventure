extends Area2D

signal Hedgehog_hurted

func _on_Spikes_body_entered(body):
	emit_signal("Hedgehog_hurted")
