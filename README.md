#Audio Manager Plugin Documentation
##Overview
The Audio Manager Plugin for Godot Engine provides an easy way to manage, play, and control sounds within your games. This plugin allows you to assign, play, and adjust audio clips directly from the Inspector without needing to reference them manually in your code.

The plugin uses an AudioManager that acts as a singleton to manage all sound effects. You can define different sound clips in the plugin's settings and trigger them throughout your game using the provided method play_sound().

##Features
- Easy Sound Management: Manage all your sound effects in one place.
- Play Sound by Name: Trigger sounds by their names in your game.
- Volume and Pitch Control: Adjust the volume and pitch of each sound.
- Autoload Setup: Automatically available as a global singleton.
- Sound Configuration: Set sounds with easy-to-use Dictionary or SoundEntry configuration.
- Customizable: You can modify the plugin to fit your project's specific needs.

##Installation
Download the Plugin:

Download the plugin from the repository or create the plugin manually.
Install in Godot:

Add the plugin to your project by placing it in the res://addons/audio_manager/ directory.
Enable the Plugin:

Go to Project > Project Settings > Plugins.
Find the Audio Manager plugin and enable it.
Setup
Autoload Configuration:

The plugin automatically registers an AudioManager singleton using Autoload. It allows you to access the AudioManager from anywhere in your code without needing to reference the scene or node directly.
To enable the AudioManager as an Autoload, ensure that the plugin is enabled and configured correctly in Project Settings.
Audio Manager Configuration:

In the AudioManager script, you can add and configure your sounds using the Inspector. Sounds are stored in an array of SoundEntry objects, where each object holds the name of the sound and its corresponding AudioStream resource.
You can assign sound files directly from the Inspector.
