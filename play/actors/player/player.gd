extends CharacterBody2D
class_name Player


signal health_ui_update
signal level_ui_update
signal dead

@export_group('Player Utilities')
@export var anim : AnimationPlayer
@export var sprite : Sprite2D
@export var weapon_holder : Marker2D
@export var camera : PlayerCamera
@export var audio_player : AudioStreamPlayer2D

@export_group('Component References')
@export var health_component : HealthComponent
@export var velocity_component : VelocityComponent

var level : int = 0
var exp_points : int = 0
var next_lvl_exp : int = 5
var enemies_killed : int = 0

@onready var weapons : Array[Node] = weapon_holder.find_children('*', 'Weapon')


func _physics_process(_delta: float) -> void:
	rotate_Weapon()


func rotate_Weapon() -> void:
	weapon_holder.look_at(get_global_mouse_position())
	weapon_holder.rotate(PI/2)


func exp_up(points : int) -> void:
	enemies_killed += 1
	exp_points += points
	if exp_points >= next_lvl_exp:
		level += 1
		more_health(2)
		health_component.current_health = health_component.max_health
		health_ui_update.emit(health_component.current_health, health_component.max_health)
		$LevelUpAudio.play()
		next_lvl_exp += next_lvl_exp
		exp_points = 0
	level_ui_update.emit(level, exp_points, next_lvl_exp)


func recieve_power_up(type : int, power_amount : int) -> void:
	match type:
		0:
			more_health(power_amount)
		1:
			more_attack(power_amount)


func more_health(amount : int) -> void:
	health_component.max_health += amount
	health_ui_update.emit(health_component.current_health, health_component.max_health)


func more_attack(amount : int) -> void:
	for weapon in weapons:
		weapon.altered_damage += amount
