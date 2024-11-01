extends PlayerState


func enter(_previous_state_path: String, _data := {}) -> void:
	attack()
	finished.emit(NONE)


func attack() -> void:
	for weapon in player.weapons:
		weapon.attack(player.weapon_holder.rotation)


func exit() -> void:
	pass


func handle_input(_event : InputEvent) -> void:
	pass


func update(_delta : float) -> void:
	pass


func physics_update(_delta: float) -> void:
	pass
