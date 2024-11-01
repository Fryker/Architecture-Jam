extends Node2D
class_name HealthComponent


signal health_down()
signal health_up

@export var max_health : int

var current_health : int:
	set(health): 
		current_health = health

var can_lose_health : bool = true
var empty_health : bool = false


func _ready() -> void:
	await owner.ready
	current_health = max_health


func healt_up(heal : HealData) -> void:
	current_health += heal.heal_healing
	health_up.emit()


func healt_down(attack : AttackData) -> void:
	if can_lose_health:
		current_health -= attack.attack_damage

		if current_health <= 0:
			empty_health = true
		elif current_health > 0:
			health_down.emit()
