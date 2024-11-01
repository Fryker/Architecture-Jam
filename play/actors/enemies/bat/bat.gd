class_name Bat extends Enemy


@export var health_component : HealthComponent
@export var velocity_component : VelocityComponent
@export var hit_box_component : HitBoxComponent
@export var path_finding_component : PathFindingComponent
@export var navigation_component : NavigationComponent
@export var detect_area_component : DetectAreaComponent

@export var sprite : Sprite2D
@export var anim : AnimationPlayer


var follow_target : Player


func _ready() -> void:
	assign_data()
	path_finding_component.obtain_target(follow_target)


func assign_data() -> void:
	sprite.set_texture(enemy_data.sprite)
	health_component.max_health = enemy_data.max_health
	hit_box_component.data.attack_damage = enemy_data.attack
	velocity_component.max_speed = enemy_data.max_speed
	velocity_component.min_speed = enemy_data.min_speed
	velocity_component.speed = enemy_data.speed
