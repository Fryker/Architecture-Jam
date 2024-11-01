extends GhostState


func enter(_previous_state_path: String, _data := {}) -> void:
	ghost.detect_area_component.detect_entitie.connect(player_detected)
	ghost.health_component.health_down.connect(lose_health)
	ghost.path_finding_component.navigation_component.avoidance_enabled = true
	ghost.path_finding_component.stop_following_target = false
	ghost.anim.play('Move')


func exit() -> void:
	ghost.path_finding_component.navigation_component.avoidance_enabled = false
	ghost.path_finding_component.stop_following_target = true
	ghost.detect_area_component.detect_entitie.disconnect(player_detected)
	ghost.health_component.health_down.disconnect(lose_health)


func handle_input(_event : InputEvent) -> void:
	pass


func update(_delta : float) -> void:
	if ghost.health_component.empty_health:
		finished.emit(DEAD)


func physics_update(_delta : float) -> void:
	pass


func player_detected(entitie : CharacterBody2D) -> void:
	if entitie is Player:
		finished.emit(ATTACK)


func lose_health() -> void:
	if ghost.health_component.empty_health:
		finished.emit(DEAD)
	else:
		finished.emit(HURT)
