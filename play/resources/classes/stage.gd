class_name Stage extends Node2D


signal stage_bounds_change(bounds : Array[Vector2])

@export var play_world : Node2D
@export var player : Player
@export var player_camera : PlayerCamera
@export var player_ui : PlayerUI
@export var game_over_screen : GameOverScreen
@export var stage_map : StageTileMap
@export var background_music : AudioStreamPlayer


var stage_bounds : Array[Vector2]


func update_stage_bounds(bounds : Array[Vector2]) -> void:
	stage_bounds = bounds
	stage_bounds_change.emit(bounds)
