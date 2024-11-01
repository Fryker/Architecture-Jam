extends PlayerState


func enter(_previous_state_path: String, _data := {}) -> void:
	player.anim.play('Idle')


func exit() -> void:
	pass


func handle_input(_event) -> void:
	pass


func update(_delta) -> void:
	if player.health_component.empty_health:
		finished.emit(DEAD)

	if Input.get_vector('Left', 'Right', 'Up', 'Down'):
		finished.emit(MOVE)


func physics_update(_delta) -> void:
	owner.velocity.x = move_toward(owner.velocity.x, 0, player.velocity_component.speed)
	owner.velocity.y = move_toward(owner.velocity.y, 0, player.velocity_component.speed)
