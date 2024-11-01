extends BatState


func enter(_previous_state_path: String, _data := {}) -> void:
	bat.health_component.can_lose_health = false
	bat.anim.play('Hurt')
	await bat.anim.animation_finished
	finished.emit(MOVE)


func exit() -> void:
	bat.health_component.can_lose_health = true


func handle_input(_event) -> void:
	pass


func update(_delta) -> void:
	pass


func _physics_update(_delta) -> void:
	pass
