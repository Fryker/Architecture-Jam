extends BatState


func enter(_previous_state_path: String, _data := {}) -> void:
	bat.anim.play('Attack')
	await bat.anim.animation_finished
	finished.emit(MOVE)


func handle_input(_event: InputEvent) -> void:
	pass


func update(_delta: float) -> void:
	if bat.health_component.empty_health:
		finished.emit(DEAD)


func physics_update(_delta: float) -> void:
	pass


func exit() -> void:
	pass
