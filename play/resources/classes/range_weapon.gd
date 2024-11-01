class_name RangeWeapon extends Weapon


@export var projectile_scene : PackedScene
@export var projectile_spawn : Marker2D
@export var audio_player : AudioStreamPlayer2D
@export var wait_time : float = 0.5
@export var big_projectile_time : float = 3

var waiting : bool = false
var big_projectile : bool = true
var altered_damage : int = 0
var wait_timer = Timer.new()
var big_projectile_timer = Timer.new()


func _ready() -> void:
	wait_timer.set('one_shot', true)
	wait_timer.timeout.connect(wait_time_finished)
	add_child(wait_timer)
	big_projectile_timer.set('one_shot', true)
	big_projectile_timer.timeout.connect(big_projectile_shoot)
	add_child(big_projectile_timer)


func attack(direction : float) -> void:
	if !waiting:
		create_projectile(direction)
		waiting = true
		wait_timer.start(wait_time)


func create_projectile(direction : float) -> void:
	var projectile : Projectile = projectile_scene.instantiate()
	audio_player.set_stream(projectile.audio_stream)
	if altered_damage > 0:
		projectile.normal_damage += altered_damage
	projectile.direction = direction
	projectile.spawn_position = projectile_spawn.global_position
	projectile.spawn_rotation = projectile_spawn.global_rotation
	if big_projectile:
		projectile.set('big', true)
		big_projectile = false
		big_projectile_timer.start(big_projectile_time)
	else:
		projectile.set('big', false)
	audio_player.play()
	Booth.game_controller.world_2d.add_child.call_deferred(projectile)


func wait_time_finished() -> void:
	waiting = false


func big_projectile_shoot() -> void:
	big_projectile = true
