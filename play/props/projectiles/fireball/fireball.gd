extends Projectile


@onready var tween : Tween
@onready var tween2 : Tween


func _ready() -> void:
	super()
	animate()
	move_projectile()


func shoot() -> void:
	pass


func _physics_process(_delta: float) -> void:
	move_projectile()


func animate() -> void:
	tween = get_tree().create_tween().set_loops().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
	tween.tween_property($Sprite2D, 'rotation', 90, 10)
	tween.chain().tween_property($Sprite2D, 'rotation', 0, 0)
	tween2 = get_tree().create_tween().set_loops().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_OUT)
	tween2.tween_property($Sprite2D, 'scale', Vector2(min_size, min_size), 0.5)
	tween2.chain().tween_property($Sprite2D, 'scale', Vector2(max_size, max_size), 0.5)


func hit_box_contact() -> void:
	stop_anim()


func projectile_life_span_end() -> void:
	stop_anim()
	super()


func stop_anim() -> void:
	tween.stop()
	tween2.stop()
