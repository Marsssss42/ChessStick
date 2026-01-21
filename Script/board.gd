extends Node2D

@export var grid_width: int = 8
@export var grid_height: int = 8
@export var tile_size: int = 32
@export var white_tile_scene: PackedScene = get("res://Scene/Board/Inactive/inactive_whiteBoard.tscn")
@export var black_tile_scene: PackedScene = get("res://Scene/Board/Inactive/inactive_blackBoard.tscn")
@export var black_pawn: PackedScene = get("res://Scene/BlackPawn.tscn")
@export var white_pawn: PackedScene = get("res://Scene/WhitePawn.tscn")
@export var activeWhite_tile: PackedScene
@export var activeBlack_tile: PackedScene


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
	
	
	center_camera()
	

# If using a Camera2D as a child of GameBoard
func center_camera():
	var board_center_x = (grid_width * tile_size) / 2
	var board_center_y = (grid_height * tile_size) / 2
	$Camera2D.position = Vector2(board_center_x, board_center_y)

func spawn_piece(grid_x: int, grid_y: int, piece: PackedScene):
	if piece:
		var new_piece = piece.instantiate()
		add_child(new_piece)
		
		new_piece.position = Vector2(grid_x * tile_size, grid_y * tile_size)
		
		# Optional: Identify the piece's grid coordinate for later logic
		# new_piece.grid_pos = Vector2i(grid_x, grid_y)
		
func starting_piece():
	for x in range(grid_width):
		spawn_piece(x, 1, black_pawn)
		spawn_piece(x, 6, white_pawn)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generate_board() # Replace with function body.
	starting_piece()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
