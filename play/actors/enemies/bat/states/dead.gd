extends BatState


func enter(_previous_state_path: String, _data := {}) -> void:
	bat.anim.play(DEAD)
	bat.defeated.emit(bat.enemy_data.exp_points)
	await bat.anim.animation_finished
	owner.queue_free()


func exit() -> void:
	pass


func handle_input(_event) -> void:
	pass


func update(_delta) -> void:
	pass


func physics_update(_delta) -> void:
	pass
