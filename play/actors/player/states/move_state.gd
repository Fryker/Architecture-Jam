extends PlayerState


func enter(_previous_state_path: String, _data := {}) -> void:
	player.anim.play('Move')


func exit() -> void:
	pass


func handle_input(_event : InputEvent) -> void:
	pass


func update(_delta) -> void:
	if player.health_component.empty_health:
		finished.emit(DEAD)


func physics_update(_delta) -> void:
	var direction := Input.get_vector('Left', 'Right', 'Up', 'Down')
	if direction:
		player.velocity_component.move(owner, player.velocity_component.go_to_direction(direction))
		if direction.x <= -1:
			player.sprite.flip_h = true
		elif direction.x >= 1:
			player.sprite.flip_h = false
	else:
		finished.emit(IDLE)
