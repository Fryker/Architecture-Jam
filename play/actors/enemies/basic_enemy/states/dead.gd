extends BasicEnemyState


func enter(_previous_state_path: String, _data := {}) -> void:
	basic_enemy.anim.play(DEAD)
	basic_enemy.defeated.emit(basic_enemy.enemy_data.exp_points)
	await basic_enemy.anim.animation_finished
	owner.queue_free()


func exit() -> void:
	pass


func handle_input(_event) -> void:
	pass


func update(_delta) -> void:
	pass


func physics_update(_delta) -> void:
	pass
