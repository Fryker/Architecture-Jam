class_name Enemy extends Node2D


@export var enemy_data : EnemyData
@export var enemy_data_types : Array[EnemyData] = []

signal defeated(points : int)
