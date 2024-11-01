extends Spawner


func spawn(pos : Vector2) -> void:
	var enemy : Enemy = actor_scenes.pick_random().instantiate()
	
	enemy.enemy_data = enemy.enemy_data_types.pick_random()
	enemy.position = pos
	enemy.follow_target = stage.player
	enemy.defeated.connect(stage.player.exp_up)

	stage.add_child(enemy)


func random_position() -> Vector2:
	return stage.player.position + distance * Vector2.RIGHT.rotated(randf_range(0, 2 * PI))


func amount(number : int = 1):
	for n in range(number):
		spawn(random_position())


func spawn_timer_finished() -> void:
	second += 1
	amount(second % 10)
