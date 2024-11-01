extends BasicEnemyState


func enter(_previous_state_path: String, _data := {}) -> void:
	basic_enemy.anim.play('Attack')
	await basic_enemy.anim.animation_finished
	finished.emit(MOVE)


func handle_input(_event: InputEvent) -> void:
	pass


func update(_delta: float) -> void:
	if basic_enemy.health_component.empty_health:
		finished.emit(DEAD)


func physics_update(_delta: float) -> void:
	pass


func exit() -> void:
	pass
