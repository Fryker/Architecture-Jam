extends Spawner


func spawn(pos : Vector2) -> void:
	var power_up : PowerUp = actor_scenes.pick_random().instantiate()
	
	power_up.position = pos
	power_up.give_power_up.connect(stage.player.recieve_power_up)

	stage.add_child(power_up)


func random_position() -> Vector2:
	return stage.player.position + distance * Vector2.RIGHT.rotated(randf_range(0, 2 * PI))


func amount(number : int = 1):
	for n in range(number):
		spawn(random_position())


func spawn_timer_finished() -> void:
	spawn_timer.start(randi_range(20, 40))
	amount(1)
