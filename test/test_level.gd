extends Stage


func _ready() -> void:
	play_world.player.reparent.call_deferred(self)
	var ghosts := $Enemies.find_children('*', 'Enemy')
	for ghost in ghosts:
		ghost.follow_target = play_world.player
