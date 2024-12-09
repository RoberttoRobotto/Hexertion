extends Node

#@onready var generateHexGrid = get_node("/GenerateHexGrid")
#var listOfHexagonTiles = generateHexGrid.listOfHexagonTiles
var listOfHexagonTiles = get_node("/GenerateHexGrid").listOfHexagonTiles

var _numExempt
var _numBorder
var _numBlank
var _numCheckSelf
var _numEmpty

var isBorderTilesChecked
var isIncludeSelfTilesChecked
var isEmptyTilesChecked

@onready var setTileScript = get_node("/SetPuzzleTiles")
@onready var puzzleModeMenu = get_node("/PuzzleMenu")

# Called when the node enters the scene tree for the first time.
func _ready():
	setTiles()
	pass # Replace with function body.

func setTiles():
	var RemainingTiles = listOfHexagonTiles
	#Set X tiles to Exempt tiles
	RemainingTiles = setTileScript.setExemptTiles(RemainingTiles, randi_range(6,8))
	
	#if Border Tiles are added, add border tiles
	#Set X tiles to Blank tiles (-X because of border tiles)
	if puzzleModeMenu.get_node("BorderTiles").isPressed:
		RemainingTiles = setTileScript.setBorderTiles(RemainingTiles, randi_range(3,4))
		RemainingTiles = setTileScript.setBlankTiles(RemainingTiles, randi_range(3,4))
	else:
		RemainingTiles = setTileScript.setBlankTiles(RemainingTiles, randi_range(6,8))
	
	#if Include Self tiles are checkboxed, add subtype Self tiles
	if puzzleModeMenu.get_node("SelfTiles").isPressed:
		RemainingTiles = setTileScript.setCheckSelfTiles(RemainingTiles, randi_range(2,3))

	#if Empty tiles are selected, add subtype empty tiles
	#No empty tiles are allowed to be 
	if puzzleModeMenu.get_node("EmptyTiles").isPressed:
		RemainingTiles = setTileScript.setCheckSelfTiles(RemainingTiles, randi_range(2,3))
	
	#Set all remaining tiles to Tally Tilse
	setTileScript.setTallyTiles(RemainingTiles)
	
	_SetAdjNumOnTiles(listOfHexagonTiles)
	pass

func _SetAdjNumOnTiles(listOfHexagonTiles):
	for n in range(0,listOfHexagonTiles.Size()):
		var checkAdjacentHex
		var numValid = 0
		var numAdj = 0
		var islandCheck = false
		var q
		var r
		var s
		
		checkAdjacentHex.append((q-1)+","+(r+1)+","+s)
		checkAdjacentHex.append((q-1)+","+r+","+(s+1))
		checkAdjacentHex.append(q+","+(r-1)+","+(s+1))
		checkAdjacentHex.append(q+","+(r+1)+","+(s-1))
		checkAdjacentHex.append((q+1)+","+(r-1)+","+s)
		checkAdjacentHex.append((q+1)+","+r+","+(s-1))
		
		for m in range(0, checkAdjacentHex.Size()):
			var tileType
			
			
			
	
	
	
	pass
