extends Area2D

signal hedgehog_fall

func _on_Area2D_body_entered(body):
	$Death.play()
	emit_signal("hedgehog_fall")
