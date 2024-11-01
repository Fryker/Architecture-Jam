extends Area2D
class_name HitBoxComponent


signal hit_box_contact()

@export var data : AttackData
@export var delete_on_contact : bool = false

@onready var collision : CollisionShape2D = $CollisionShape2D


func _on_area_entered(area: Area2D) -> void:
	hit_box_contact.emit()
	if area is HurtBoxComponent and area.owner != owner:
		var hurt_box = area
		hurt_box.contact(data)
	if delete_on_contact:
		owner.queue_free()


func hitbox_status(status : bool) -> void:
	monitoring = status
	collision.disabled = !status
