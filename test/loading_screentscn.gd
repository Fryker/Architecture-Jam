extends Control


func _ready() -> void:
	await get_tree().create_timer(5).timeout
	Booth.game_controller.change_gui_scene('res://play/ui/main_menu/main_menu.tscn',true, false, true)
