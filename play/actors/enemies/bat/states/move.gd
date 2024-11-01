extends BatState


func enter(_previous_state_path: String, _data := {}) -> void:
	bat.detect_area_component.detect_entitie.connect(player_detected)
	bat.health_component.health_down.connect(lose_health)
	bat.path_finding_component.navigation_component.avoidance_enabled = true
	bat.path_finding_component.stop_following_target = false
	bat.anim.play('Move')


func exit() -> void:
	bat.path_finding_component.navigation_component.avoidance_enabled = false
	bat.path_finding_component.stop_following_target = true
	bat.detect_area_component.detect_entitie.disconnect(player_detected)
	bat.health_component.health_down.disconnect(lose_health)


func handle_input(_event : InputEvent) -> void:
	pass


func update(_delta : float) -> void:
	if bat.health_component.empty_health:
		finished.emit(DEAD)


func physics_update(_delta : float) -> void:
	pass


func player_detected(entitie : CharacterBody2D) -> void:
	if entitie is Player:
		finished.emit(ATTACK)


func lose_health() -> void:
	if bat.health_component.empty_health:
		finished.emit(DEAD)
	else:
		finished.emit(HURT)
