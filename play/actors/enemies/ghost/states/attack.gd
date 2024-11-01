extends GhostState


func enter(_previous_state_path: String, _data := {}) -> void:
	ghost.anim.play('Attack')
	await ghost.anim.animation_finished
	finished.emit(MOVE)


func handle_input(_event: InputEvent) -> void:
	pass


func update(_delta: float) -> void:
	if ghost.health_component.empty_health:
		finished.emit(DEAD)


func physics_update(_delta: float) -> void:
	pass


func exit() -> void:
	pass
