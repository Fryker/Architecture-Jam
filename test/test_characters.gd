extends Node2D


func _ready() -> void:
	for child in self.get_children():
		await child.ready
