extends Node2D

@export var grid_width: int = 8
@export var grid_height: int = 8
@export var tile_size: int = 32
@export var white_tile_scene: PackedScene = get("res://Scene/Board/Inactive/inactive_whiteBoard.tscn")
@export var black_tile_scene: PackedScene = get("res://Scene/Board/Inactive/inactive_blackBoard.tscn")
@export var black_pawn = "res://Scene/BlackPawn.tscn"
@export var white_pawn = "res://Scene/WhitePawn.tscn"

func generate_board():
	var new_tile
	for x in range(grid_width):
		for y in range(grid_height):
			if (x + y) % 2 == 0 :
				new_tile = white_tile_scene.instantiate()
			else :
				new_tile = black_tile_scene.instantiate()
			
			add_child(new_tile)
			new_tile.position = Vector2(x * tile_size, y * tile_size)
			
	var board_pixel_width = grid_width * tile_size
	var board_pixel_height = grid_height * tile_size
	position = Vector2(-board_pixel_width / 2, -board_pixel_height / 2)
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generate_board() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
