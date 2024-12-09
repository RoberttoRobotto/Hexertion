extends Node
var HexGrid = load("res://Scripts/GenerateHexGrid3.gd")
var DealTiles = load("res://Scripts/DealTiles.gd")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#1) Confirm all variaables regarding gameplay parameters
	#Get the number of players and instantiate the PlayerHandPrefabs
	var numPlayers = 2
	#Get boolean variable from Border Tiles checkbox
	var withBorderTiles = false #TODO: NEED TO PULL CHECKBOX FROM MENU SCRIPT
	#Get boolean variable from Mixed Tiles checkbox
	var withMixedTiles = false #TODO: NEED TO PULL CHECKBOX FROM MENU SCRIPT
	#2) Generate the Hexagon Hitbox Grid
	HexGrid.GenerateGrid()
	
	#3) Generate and distribute tiles based on selected options
	DealTiles.GenerateHands(numPlayers)
	DealTiles.DealTiles(numPlayers, withBorderTiles, withMixedTiles)
	
	#4) Choose a player at random to play first. Continue to gameplay
	var StartingPlayer = randi_range(1,numPlayers)
	
	
	
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
