class_name Spawner extends Node2D


@export var actor_scenes : Array[PackedScene] = []
@export var stage : Stage
@export var spawn_timer : Timer

@export var distance : float = 100


var minute : int :
	set(value):
		minute = value


var second : int :
	set(value):
		second = value
		if second >= 60:
			second -= 10
			minute += 1


func stop_spawning() -> void:
	spawn_timer.stop()
