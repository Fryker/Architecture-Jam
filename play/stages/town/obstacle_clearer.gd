extends TileMapLayer


@export var obstacle_layers : Array[TileMapLayer]


func _use_tile_data_runtime_update(coords: Vector2i) -> bool:
	for obstacles in obstacle_layers:
		if coords in obstacles.get_used_cells_by_id(0):
			return true
	return false


func _tile_data_runtime_update(coords: Vector2i, tile_data: TileData) -> void:
	for obstacles in obstacle_layers:
		if coords in obstacles.get_used_cells_by_id(0):
			tile_data.set_navigation_polygon(0, null)