extends CanvasLayer

signal transition_end
const anim_name = ("Fadein")

func transition():
	$AnimationPlayer.play("Fadein")


func _on_AnimationPlayer_animation_finished(anim_name):
	emit_signal("transition_end")
