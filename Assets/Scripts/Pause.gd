extends CanvasLayer

var is_pausable := true

func _ready():
	set_visible(false)
	
func _input(event):
	if event.is_action_pressed("pause") and is_pausable == true:
		set_visible(!get_tree().paused)
		get_tree().paused = !get_tree().paused
		
func _process(delta):
	if get_tree().paused == true and Input.is_action_just_pressed("pause") and is_pausable == true:
		$VBoxContainer/ContinueButton.grab_focus()

func _on_ContinueButton_pressed():
	get_tree().paused = false
	set_visible(false)
	
func set_visible(is_visible):
	for node in get_children():
		node.visible = is_visible


func _on_Save_and_exitButton_pressed():
	set_visible(false)
	get_tree().paused = false
	SaveSystem.Save_Game()
