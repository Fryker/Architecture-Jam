class_name EnemyData extends Resource


@export var sprite : Texture2D
@export var max_health : int
@export var health : int
@export var attack : int
@export var max_speed : int
@export var min_speed : int
@export var speed : int
@export var exp_points : int
@export var animations : AnimationLibrary


func assing_basic_enemy_data(basic_enemy : BasicEnemy) -> void:
	basic_enemy.sprite.set_texture(sprite)
	basic_enemy.health_component.max_health = max_health
	basic_enemy.hit_box_component.data.attack_damage = attack
	basic_enemy.velocity_component.max_speed = max_speed
	basic_enemy.velocity_component.min_speed = min_speed
	basic_enemy.velocity_component.speed = speed
	basic_enemy.anim.remove_animation_library("")
	basic_enemy.anim.add_animation_library("", animations)
