extends CanvasLayer

signal transition_end
const anim_name = ("Fadein")

func fadein():
	$AnimationPlayer.play("Fadein")
	
func fadeout():
	$AnimationPlayer.play("Fadeout")


func _on_AnimationPlayer_animation_finished(anim_name):
	emit_signal("transition_end")
