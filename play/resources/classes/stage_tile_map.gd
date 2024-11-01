class_name StageTileMap extends TileMapLayer
 


func get_tile_map_bounds() -> Array[Vector2]:
	var bounds : Array[Vector2] = []
	bounds.append(Vector2(get_used_rect().position * rendering_quadrant_size))
	bounds.append(Vector2(get_used_rect().end * rendering_quadrant_size))
	return bounds
