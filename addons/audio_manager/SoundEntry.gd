@tool
class_name SoundEntry
extends Resource

@export var audio_name : String = ""
@export var audio : AudioStream = null
@export_range(0.0, 1.0, 0.1) var audio_volume: float = 1.0
@export_range(0.0, 1.0, 0.1) var audio_pitch: float = 1.0
