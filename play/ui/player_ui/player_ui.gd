class_name PlayerUI extends UI


@export var player_health_ui : TextureProgressBar
@export var player_level_bar : TextureProgressBar
@export var survive_timer : Timer
@export var survive_time_label : Label
@export var level_label : Label

var survive_time : int = 0


func _ready() -> void:
	hide()
	survive_timer.start()
	if ui_holder != null:
		ui_holder.reparent.call_deferred(Booth.game_controller.gui)
	if Booth.game_controller != null and Booth.game_controller.current_2d_scene:
		Booth.game_controller.current_2d_scene.player_ui = self
	await get_tree().create_timer(1).timeout
	show()


func update_health_ui(health : int, max_health : int) -> void:
	if max_health > 0:
		player_health_ui.max_value = max_health
	player_health_ui.value = health


func update_level_ui(level : int, exp_points : int, max_level_exp : int) -> void:
	if max_level_exp > player_level_bar.max_value:
		player_level_bar.max_value = max_level_exp
	player_level_bar.value = exp_points
	level_label.text = 'Level: %s' % level


func time_up() -> void:
	survive_time += 1
	survive_time_label.text = 'Time Survived: %s' % survive_time
