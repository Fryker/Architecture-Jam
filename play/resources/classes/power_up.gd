class_name PowerUp extends Node2D


signal give_power_up(power_up_type : PowerUpTypes, power_amount : int)

@export var detect_area : DetectAreaComponent
@export var despawn_timer : Timer
@export var anim : AnimationPlayer
@export var power_amount : int = 1

enum PowerUpTypes {HEALTH, DAMAGE}
@export var power_up_type : PowerUpTypes


func _ready() -> void:
	detect_area.detect_entitie.connect(enttitie__detected)
	despawn_timer.timeout.connect(despawn_power_up)


func enttitie__detected(entitie: CharacterBody2D) -> void:
	if entitie is Player:
		give_power_up.emit(power_up_type, power_amount)
		anim.play('Pick')


func despawn_power_up() -> void:
	queue_free()
