class_name BasicEnemy extends Enemy


@export var health_component : HealthComponent
@export var velocity_component : VelocityComponent
@export var hit_box_component : HitBoxComponent
@export var path_finding_component : PathFindingComponent
@export var navigation_component : NavigationComponent
@export var detect_area_component : DetectAreaComponent

@export var anim : AnimationPlayer
@export var sprite : Sprite2D

var follow_target : Player


func _ready() -> void:
	enemy_data.assing_basic_enemy_data(self)
	path_finding_component.obtain_target(follow_target)
