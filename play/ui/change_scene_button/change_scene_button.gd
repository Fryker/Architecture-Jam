extends Button


@export var change_2d_scene : bool = true
@export var change_both : bool = true
@export var scene_path_2d : String
@export var scene_path_gui : String
@export var delete : bool = false
@export var keep_running : bool = false
@export var transition : bool = false
@export var transition_in : String = 'Fade In'
@export var transition_out : String = 'Fade Out'
@export var seconds : float = 1.0
@export var audio_stream : AudioStreamPlayer

@export var hover_sound : AudioStreamWAV
@export var pressed_sound : AudioStreamWAV

func change_on_pressed() -> void:
	disabled = true
	audio_stream.stream = pressed_sound
	audio_stream.play()
	if change_both:
		Booth.game_controller.change_2d_scene(scene_path_2d, delete, keep_running, transition, transition_in, transition_out, seconds)
		Booth.game_controller.change_gui_scene(scene_path_gui, true, keep_running, false, transition_in, transition_out, seconds)
	elif change_2d_scene:
		await Booth.game_controller.change_2d_scene(scene_path_2d, delete, keep_running, transition, transition_in, transition_out, seconds)
		if Booth.game_controller.current_gui_scene is UI and Booth.game_controller.current_gui_scene.ui_holder != null:
			Booth.game_controller.current_gui_scene.ui_holder.queue_free()
		else:
			Booth.game_controller.current_gui_scene.queue_free()
	elif !change_2d_scene:
		Booth.game_controller.change_gui_scene(scene_path_gui, delete, keep_running, transition, transition_in, transition_out, seconds)


func hover_over_button() -> void:
	audio_stream.stream = hover_sound
	audio_stream.play()
