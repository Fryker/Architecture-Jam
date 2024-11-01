class_name PlayerCamera extends Camera2D


@export var camera_target : Node2D
@export var camera_limits : Vector2


func _ready() -> void:
	await get_tree().create_timer(1).timeout
	enabled = true
	global_position = camera_target.global_position


func _physics_process(delta: float) -> void:
	if camera_target != null:
		self.global_position = camera_target.global_position


func update_limits(bounds : Array[Vector2]) -> void:
	limit_left = int(bounds[0].x)
	limit_top = int(bounds[0].y)
	limit_right = int(bounds[1].x)
	limit_bottom = int(bounds[1].y)
