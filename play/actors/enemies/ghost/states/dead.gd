extends GhostState


func enter(_previous_state_path: String, _data := {}) -> void:
	ghost.anim.play(DEAD)
	ghost.defeated.emit(ghost.enemy_data.exp_points)
	await ghost.anim.animation_finished
	owner.queue_free()


func exit() -> void:
	pass


func handle_input(_event) -> void:
	pass


func update(_delta) -> void:
	pass


func physics_update(_delta) -> void:
	pass
