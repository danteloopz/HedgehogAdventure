extends Control

onready var selector_one = $VBoxContainer/PlayButton/HBoxContainer/Selector
onready var selector_two = $VBoxContainer/SettingsButton/HBoxContainer/Selector
onready var selector_three = $VBoxContainer/ExitButton/HBoxContainer/Selector

var current_selection = 0



func _ready():
	MusicController.play_music()
	Pause.is_pausable = false
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
	$Select.play()
	$TransisionScreen.fadein()

func _on_SettingsButton_pressed():
	$Select.play()
	$Popup.show()
	$Popup/Tabs/HBoxContainer/Video.grab_focus()


func _on_ExitButton_pressed():
	$Exit.play()

func _on_Exit_finished():
	get_tree().quit()

func _on_TransisionScreen_transition_end():
	SaveSystem.Load_GAME()

func _on_Video_pressed():
	$Popup/Tabs/SettingsContainer/VideoSettings.show()
	$Popup/Tabs/SettingsContainer/AudioSettings.hide()
	$Popup/Tabs/SettingsContainer/Controls.hide()


func _on_Audio_pressed():
	$Popup/Tabs/SettingsContainer/VideoSettings.hide()
	$Popup/Tabs/SettingsContainer/AudioSettings.show()
	$Popup/Tabs/SettingsContainer/Controls.hide()


func _on_Controlls_pressed():
	$Popup/Tabs/SettingsContainer/VideoSettings.hide()
	$Popup/Tabs/SettingsContainer/AudioSettings.hide()
	$Popup/Tabs/SettingsContainer/Controls.show()


func _on_BackButton_pressed():
	$VBoxContainer/ExitButton.grab_focus()
	$Popup.hide()
