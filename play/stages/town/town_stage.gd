extends Stage


func _ready() -> void:
	play_world = Booth.game_controller.world_2d
	stage_bounds_change.connect(player_camera.update_limits)
	update_stage_bounds(stage_map.get_tile_map_bounds())
	player_camera.update_limits(stage_bounds)
	player.health_ui_update.connect(player_ui.update_health_ui)
	player.level_ui_update.connect(player_ui.update_level_ui)
	player.dead.connect(player_dead)
	player.health_ui_update.emit(player.health_component.current_health, player.health_component.max_health)
	player.level_ui_update.emit(player.level, player.exp_points, player.next_lvl_exp)


func player_dead(player_kills : int) -> void:
	player_ui.survive_timer.stop()
	background_music.stop()
	get_tree().call_group('Spawner', 'stop_spawning')
	get_tree().call_group('Enemy', 'queue_free')
	get_tree().call_group('PowerUp', 'queue_free')
	var total_score : int = player_ui.survive_time
	if player_kills > 0:
		total_score *= player_kills
	player_ui.ui_holder.queue_free()
	var layer = CanvasLayer.new()
	Booth.game_controller.gui.add_child(layer)
	Booth.game_controller.change_gui_scene('res://play/ui/game_over_screen/game_over_screen.tscn', true, false, false)
	game_over_screen = Booth.game_controller.current_gui_scene
	game_over_screen.reparent(layer)
	game_over_screen.ui_holder = layer
	game_over_screen.game_over(total_score)
