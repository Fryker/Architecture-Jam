extends Node
class_name VelocityComponent


@export var max_speed : float = 0.0
@export var min_speed : float = 0.0
@export var speed : float = 0.0

var new_velocity : Vector2


func accelerate_to_velocity(to_speed) -> float:
	speed = lerp(speed, to_speed, 0.1)
	return speed


func decelerate_velocity() -> void:
	accelerate_to_velocity(0.0)


func go_to_direction(direction : Vector2) -> Vector2:
	new_velocity = direction * speed
	return new_velocity


func give_speed(speed_value) -> void:
	speed += speed_value
	speed = clampf(speed, min_speed, max_speed)


func give_velocity(entitie : CharacterBody2D, velocity : Vector2) -> void:
	entitie.velocity = velocity


func move(entitie : CharacterBody2D, velocity : Vector2) -> void:
	give_velocity(entitie, velocity)
	entitie.move_and_slide()
