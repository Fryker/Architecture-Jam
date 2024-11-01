extends Button


@export var audio_stream : AudioStreamPlayer
@export var hover_sound : AudioStreamWAV
@export var pressed_sound : AudioStreamWAV


func quit_game() -> void:
	disabled = true
	audio_stream.stream = pressed_sound
	audio_stream.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()


func hover_over_button() -> void:
	audio_stream.stream = hover_sound
	audio_stream.play()
