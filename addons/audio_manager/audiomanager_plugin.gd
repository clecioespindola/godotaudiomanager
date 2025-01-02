@tool
extends EditorPlugin


var autoload_name : String = "AudioManager"
var autoload_path : String = "res://addons/audio_manager/AudioManager.gd"
var audio_manager : Script
var audio_manager_icon : Texture2D

func _enter_tree():
	#Connect Resource Saved Signal to Accept changes on file
	get_editor_interface().get_resource_filesystem().resource_saved.connect(_on_resource_save)
	#Reference to Audio Manager Scene
	audio_manager = load("res://addons/audio_manager/AudioManager.gd")
	audio_manager_icon = load("res://addons/audio_manager/icon.png")
		
	#Add AudioManager Custom Type
	add_custom_type("AudioManager", "Node2D", audio_manager, audio_manager_icon)
	
func _exit_tree():
	# Remove the Custom Type when leaving plugin
	remove_custom_type("AudioManager")
	
	#Disconnet Resource Saved Signal to prevent errors
	get_editor_interface().get_resource_filesystem().resource_saved.disconnect(_on_resource_save)


func _on_resource_save(resource):
	#Compare Resource Path to AutoLoad Path
	if resource.resource_path == audio_manager:
		_reload_autoload()
		
func _reload_autoload():
	#Remove Autoload if different version
	remove_autoload_singleton(autoload_name)
	
	#Await Resource Saved
	await resource_saved
	
	#Re-Add Autoload to Project Settings	
	add_autoload_singleton(autoload_name, autoload_path)
