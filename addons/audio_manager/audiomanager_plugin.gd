@tool
extends EditorPlugin


var autoload_name : String = "AudioManager"
var autoload_path : String = "res://addons/audio_manager/audio_manager.tscn"
var audio_manager : Script
var audio_manager_icon : Texture2D

func _enter_tree():
	#Reference to Audio Manager Scene
	audio_manager = load("res://addons/audio_manager/AudioManager.gd")
	audio_manager_icon = load("res://addons/audio_manager/icon.png")
	
	#Add AudioManager Custom Type
	add_custom_type("AudioManager", "Node2D", audio_manager, audio_manager_icon)
	#Connect Resource Saved Signal to Accept changes on file
	add_autoload_singleton(autoload_name, autoload_path)
	
func _exit_tree():
	# Remove the Custom Type when leaving plugin
	remove_custom_type("AudioManager")
	remove_autoload_singleton(autoload_name)
