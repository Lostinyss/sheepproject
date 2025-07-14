extends Node2D

@onready var tilemap : TileMapLayer = $Flooring  # Change this path if needed
const TILE_ID = 0  # Replace with the ID of the tile you want to place

const SOURCE_ID = 0  # ID of the TileSetSource (usually 0 if you only have one)
const ATLAS_COORDS = Vector2i(0, 0)  # Position of the tile in the atlas grid
const ALT_TILE = 0  # Alternative tile index (if any)

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		
		var mouse_pos = get_global_mouse_position()
		var local_pos = tilemap.to_local(mouse_pos)
		var tile_coords = tilemap.local_to_map(local_pos)

		tilemap.set_cell(tile_coords, SOURCE_ID, ATLAS_COORDS, ALT_TILE)
