extends PlayerState


@export var hurt_audio_stream : AudioStream


func player_health_down() -> void:
	if player.health_component.can_lose_health:
		player.health_ui_update.emit(player.health_component.current_health, 0)
		animate_hurt()


func animate_hurt() -> void:
	var tween : Tween = get_tree().create_tween()
	player.health_component.can_lose_health = false
	player.audio_player.set_stream(hurt_audio_stream)
	player.audio_player.play()
	tween.tween_property(player.sprite, 'modulate', Color.DEEP_SKY_BLUE, 0)
	tween.chain().tween_property(player.sprite, 'modulate', Color.WHITE, 0.2)
	tween.chain().tween_property(player.sprite, 'modulate', Color.DEEP_SKY_BLUE, 0.2)
	tween.chain().tween_property(player.sprite, 'modulate', Color.WHITE, 0.2)
	await tween.finished
	player.health_component.can_lose_health = true
