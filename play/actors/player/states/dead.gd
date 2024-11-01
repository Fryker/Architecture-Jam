extends PlayerState


func enter(_previous_state_path: String, _data := {}) -> void:
	player.anim.play('Dead')
	player.health_ui_update.emit(player.health_component.current_health, 0)
	await player.anim.animation_finished
	player.dead.emit(player.enemies_killed)
	player.queue_free()


func exit() -> void:
	pass


func handle_input(_event) -> void:
	pass


func update(_delta) -> void:
	pass


func physics_update(_delta) -> void:
	pass
