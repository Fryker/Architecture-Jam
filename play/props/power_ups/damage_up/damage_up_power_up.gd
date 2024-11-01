extends PowerUp


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	match anim_name:
		'Appear':
			$AnimationPlayer.play('Idle')
		'Pick':
			queue_free()
