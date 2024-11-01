extends Area2D
class_name HurtBoxComponent


signal hurt_box_contact

@export_group('ComponentReferences')
@export var health_component : HealthComponent

@onready var collision : CollisionShape2D = $CollisionShape2D


func contact(attack : AttackData) -> void:
	hurt_box_contact.emit()
	if health_component:
		health_component.healt_down(attack)


func hurt_box_status(status : bool) -> void:
	monitoring = status
	collision.disabled = !status
