extends BasicEnemyState


func enter(_previous_state_path: String, _data := {}) -> void:
	basic_enemy.detect_area_component.detect_entitie.connect(player_detected)
	basic_enemy.health_component.health_down.connect(lose_health)
	basic_enemy.path_finding_component.navigation_component.avoidance_enabled = true
	basic_enemy.path_finding_component.stop_following_target = false
	basic_enemy.anim.play('Move')


func exit() -> void:
	basic_enemy.path_finding_component.navigation_component.avoidance_enabled = false
	basic_enemy.path_finding_component.stop_following_target = true
	basic_enemy.detect_area_component.detect_entitie.disconnect(player_detected)
	basic_enemy.health_component.health_down.disconnect(lose_health)


func handle_input(_event : InputEvent) -> void:
	pass


func update(_delta : float) -> void:
	if basic_enemy.health_component.empty_health:
		finished.emit(DEAD)


func physics_update(_delta : float) -> void:
	pass


func player_detected(entitie : CharacterBody2D) -> void:
	if entitie is Player:
		finished.emit(ATTACK)


func lose_health() -> void:
	if basic_enemy.health_component.empty_health:
		finished.emit(DEAD)
	else:
		finished.emit(HURT)
