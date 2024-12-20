extends Node
var GridGenerator = preload("res://Scripts/GenerateHexGrid.gd").new()
var TileGenerator = preload("res://Scripts/DealTiles2.gd").new()
var HandGenerator = preload("res://Scripts/GeneratePlayerHands.gd").new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#1) Confirm all variaables regarding gameplay parameters
	#Get the number of players and instantiate the PlayerHandPrefabs
	var numPlayers = 2
	#Get boolean variable from Border Tiles checkbox
	var withBorderTiles = false #TODO: NEED TO PULL CHECKBOX FROM MENU SCRIPT
	#Get boolean variable from Mixed Tiles checkbox
	var withMixedTiles = false #TODO: NEED TO PULL CHECKBOX FROM MENU SCRIPT
	
	#2) Generate and distribute tiles based on selected options
	HandGenerator.generateHands(numPlayers)
	
	#3) Generate the Hexagon Hitbox Grid
	GridGenerator.generateGrid()
	
	#TileGenerator.DealTiles(numPlayers, withBorderTiles, withMixedTiles)
	
	#TileGenerator.SetFirstTile(HexGrid.getNode())
	
	#4) Choose a player at random to play first. Continue to gameplay
	var StartingPlayer = randi_range(1,numPlayers)
	print("Starting Player is ",StartingPlayer)
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
