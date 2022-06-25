extends Node

const SAVED_SCENE_PATH = "user://Scenes/SAVED_SCENE"
const DEFAULT_SCENE_PATH = "res://Assets/Scenes/Level1.tscn"

var SAVED_SCENE = SceneState

func Scene_Load():
	if ResourceLoader.exists(SAVED_SCENE_PATH):
		get_tree().change_scene(SAVED_SCENE_PATH)
	else:
		get_tree().change_scene(DEFAULT_SCENE_PATH)

func Scene_Save():
	 ResourceSaver.save("user://Scenes/", SAVED_SCENE)
