class_name DetectAreaComponent extends Area2D


signal detect_entitie(entitie : CharacterBody2D)

var chase : bool = false
var entitie : CharacterBody2D


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		entitie = body
		chase = true
		detect_entitie.emit(entitie)


func _on_body_exited(_body: Node2D) -> void:
	entitie = null
	chase = false
