extends CharacterBody2D
class_name Projectile


@export var life_span : float = 0
@export var hit_box_component : HitBoxComponent
@export var velocity_component : VelocityComponent
@export var sprite : Node2D
@export var audio_stream : AudioStreamWAV
@export var normal_damage : int = 2

var direction : float
var spawn_position : Vector2
var spawn_rotation : float
var life_span_timer = Timer.new()
var min_size : float = 0.5
var max_size : float = 0.8
var big_damage : int = normal_damage * 2
var big : bool = false


func _ready() -> void:
	life_span_timer.set('one_shot', true)
	life_span_timer.timeout.connect(projectile_life_span_end)
	add_child(life_span_timer)
	life_span_timer.start(life_span)
	position = spawn_position
	rotation = spawn_rotation
	make_projectile()
	move_projectile()


func make_projectile() -> void:
	if !big:
		min_size = 0.5
		max_size = 0.8
		hit_box_component.get_node('CollisionShape2D').shape.set('radius', 2)
		hit_box_component.data.set('attack_damage', normal_damage)
	else:
		min_size = 1
		max_size = 1.3
		hit_box_component.get_node('CollisionShape2D').shape.set('radius', 5)
		hit_box_component.data.set('attack_damage', big_damage)
	sprite.scale = Vector2(min_size, min_size)


func move_projectile() -> void:
	velocity_component.move(self, Vector2(0, - velocity_component.speed).rotated(direction))


func projectile_life_span_end() -> void:
	queue_free()
