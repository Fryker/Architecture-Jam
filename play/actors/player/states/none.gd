extends PlayerState


func enter(_previous_state_path: String, _data := {}) -> void:
	pass


func exit() -> void:
	pass


func handle_input(event : InputEvent) -> void:
	if event.is_action_pressed('Attack'):
		finished.emit(ATTACK)


func update(_delta :float) -> void:
	pass


func physics_update(_delta :float) -> void:
	pass
