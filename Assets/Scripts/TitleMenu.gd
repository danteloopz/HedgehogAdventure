extends Control

onready var selector_one = $VBoxContainer/PlayButton/HBoxContainer/Selector
onready var selector_two = $VBoxContainer/SettingsButton/HBoxContainer/Selector
onready var selector_three = $VBoxContainer/ExitButton/HBoxContainer/Selector

var current_selection = 0



func _ready():
	$VBoxContainer/PlayButton.grab_focus()
	set_current_selection(0)

func _process(delta):
	if Input.is_action_just_pressed("ui_down") and current_selection <2: 
		current_selection += 1
		set_current_selection(current_selection)
	if Input.is_action_just_pressed("ui_up") and current_selection >0: 
		current_selection -= 1
		set_current_selection(current_selection)

func set_current_selection(_current_selection):
	selector_one.text = ""
	selector_two.text = ""
	selector_three.text = ""
	if _current_selection == 0:
		selector_one.text = ">"
	elif _current_selection == 1:
		selector_two.text = ">"
	elif _current_selection == 2:
		selector_three.text = ">"


func _on_PlayButton_pressed():
	$TransisionScreen.transition()


func _on_SettingsButton_pressed():
	var Settings = load("res://Assets/Scenes/Settings.tscn").instance()
	get_tree().current_scene.add_child(Settings)


func _on_ExitButton_pressed():
	get_tree().quit()


func _on_TransisionScreen_transition_end():
	get_tree().change_scene("res://Assets/Scenes/Level1.tscn")
