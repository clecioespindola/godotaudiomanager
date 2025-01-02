@tool
extends EditorPlugin

var audio_manager : Script
var audio_manager_icon : Texture2D

func _enter_tree():
	#Reference to Audio Manager Scene
	audio_manager = load("res://addons/audio_manager/AudioManager.gd")
	audio_manager_icon = load("res://addons/audio_manager/icon.png")
	#Add Script to Autoload
	#TODO Find a solution to save scene to autoload
	#add_autoload_singleton("AudioManager", "res://addons/audio_manager/AudioManager.gd")
	
	#Add AudioManager Custom Type
	add_custom_type("AudioManager", "Node2D", audio_manager, audio_manager_icon)
	
func _exit_tree():
	# Remove the Custom Type when leaving plugin
	remove_custom_type("AudioManager")
