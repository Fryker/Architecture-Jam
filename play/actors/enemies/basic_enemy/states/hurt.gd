extends BasicEnemyState


func enter(_previous_state_path: String, _data := {}) -> void:
	basic_enemy.health_component.can_lose_health = false
	basic_enemy.anim.play('Hurt')
	await basic_enemy.anim.animation_finished
	finished.emit(MOVE)


func exit() -> void:
	basic_enemy.health_component.can_lose_health = true


func handle_input(_event) -> void:
	pass


func update(_delta) -> void:
	pass


func _physics_update(_delta) -> void:
	pass
