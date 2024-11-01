extends Node
class_name PathFindingComponent


@export var velocity_component : VelocityComponent
@export var navigation_component : NavigationComponent
@export var detect_area_component : DetectAreaComponent

@export var continuous_following_target : bool = false
@export var stop_following_target : bool = false


func _ready():
	if detect_area_component:
		detect_area_component.body_entered.connect(Callable(detection_area_entity_detected))

	if navigation_component:
		navigation_component.velocity_computed.connect(Callable(compute_navigation_velocity))


func _physics_process(_delta):
	if stop_following_target:
		return

	if navigation_component.is_navigation_finished() and !continuous_following_target:
		return

	if continuous_following_target:
		if navigation_component.target and navigation_component.target != null:
			set_movement_target(navigation_component.target.global_position)

	navigation_component.agent_position = navigation_component.navigation_entitie.global_position
	navigation_component.next_path_position = navigation_component.get_next_path_position()
	var new_velocity = velocity_component.go_to_direction(navigation_component.agent_position.direction_to(navigation_component.next_path_position))

	if navigation_component.avoidance_enabled:
		navigation_component.set_velocity(new_velocity)
	else:
		compute_navigation_velocity(new_velocity)


func obtain_target(target : Node2D) -> void:
	await get_tree().physics_frame

	if navigation_component.target != target:
		navigation_component.target = target
	
	if navigation_component.target != null:
		set_movement_target(navigation_component.target.global_position)


func set_movement_target(movement_target: Vector2):
	navigation_component.set_target_position(movement_target)


func detection_area_entity_detected(body: Node2D) -> void:
	obtain_target(body)


func compute_navigation_velocity(safe_velocity : Vector2) -> void:
	velocity_component.move(navigation_component.navigation_entitie, safe_velocity)
