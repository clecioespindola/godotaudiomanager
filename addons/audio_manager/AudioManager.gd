@tool
extends Node2D

@export_subgroup("Sound Settings")
@export var audio_type : String = "AudioStreamPlayer"
@export_range(0.0, 1.0, 0.1) var default_volume : float = 1.0
@export_range(0.0, 1.0, 0.1) var default_pitch : float = 1.0

@export_subgroup("List of sounds", "sounds_")
@export var sounds: Array[SoundEntry] = []


var audio_clips : Dictionary = {}

func _ready():
	for sound_entry in sounds:
		if sound_entry.audio != null and sound_entry.audio is AudioStream:
			audio_clips[sound_entry.audio_name] = sound_entry.audio
		else:
			print("Error: Invalid or missing audio in sound entry:", sound_entry.name)
			
# Function to play sound
func play_sound(audio_name: String):
	if audio_clips.has(audio_name):
		var audio_stream = audio_clips[audio_name]
		if audio_stream != null:
			var sound_player = create_audio_stream_player()
			add_child(sound_player)
			sound_player.stream = audio_stream
			sound_player.volume_db = linear_to_db(default_volume)
			sound_player.pitch_scale = default_pitch
			sound_player.play()
			# Remove the audioplayer when the sound has finished
			sound_player.finished.connect(sound_player.queue_free)
		else:
			print("No sound found: ", audio_name)
			print("Available sounds:", audio_clips.keys())  # Depuração

# Create the audioplayer based on the type in editor
func create_audio_stream_player() -> Node:
	match audio_type:
		"AudioStreamPlayer2D":
			return AudioStreamPlayer2D.new()
		"AudioStreamPlayer3D":
			return AudioStreamPlayer3D.new()
		_:
			return AudioStreamPlayer.new()
